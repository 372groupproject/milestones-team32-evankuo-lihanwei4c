import 'dart:math' show Random;
import 'Board.dart';
/* ================================================================================
 * The AI with two difficulty levels (random / smart)
 *                                   (easy   / hard)
 * Author: Hanwei Li and Evan Kuo
 *=================================================================================*/
class AI{
    bool easyMode;
    
    //== The constructor. Initialize default mode to easy ==========================
    AI(){
        easyMode = true;
    }
    
    /*-------------------------------------------------------------------------------
     * Place the given piece on board with the current difficulty.
     * @return "row col", a String representing the position this ai placed piece at. 
     * @param piece - 'O' / 'X', a string representing the piece color/shape
     * @param board - the current Board object representing the board being played on
     *-------------------------------------------------------------------------------*/
    String play(String piece, Board board){
        if(easyMode){
            return easyPlay(piece, board);
        }else{
            return hardPlay(piece, board);
        }
    }
    
    /*-------------------------------------------------------------------------------
     * Place the given piece on board on random position.
     * @return "row col", a String representing the position this ai placed piece at. 
     * @param piece - 'O' / 'X', a string representing the piece color/shape
     * @param board - the current Board object representing the board being played on
     *-------------------------------------------------------------------------------*/
    String easyPlay(String piece, Board board) {
        Random randomizer = new Random(1);
        // find out how many empty spaces there are
        int emptySpaces = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (board.getPieceAt(i, j) == '_') {
                    emptySpaces++;
                }
            }
        }

        // choose a index from 0 to emptySpaces and place there
        int randomlyChosen = randomizer.nextInt(100) % emptySpaces;
        int index = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (board.getPieceAt(i, j) != '_') {
                    continue;
                }
                if (index == randomlyChosen) {
                    board.placePieceAt(i, j, piece);
                    return i.toString() + " " + j.toString();
                }
                index++;
            }
        }
        return "";

    }
    
    /*-------------------------------------------------------------------------------
     * Place the given piece at a position that has the most benifit (potential or threat).
     * @return "row col", a String representing the position this ai placed piece at. 
     * @param piece - 'O' / 'X', a string representing the piece color/shape
     * @param board - the current Board object representing the board being played on
     *-------------------------------------------------------------------------------*/
    String hardPlay(String piece, Board board) {
        int row = 0;
        int col = 0;
        int potential = 0;
        int threat = 0;
        int largestPotential = -1;
        int largestThreat = -1;

        // Get center if possible
        if (board.getPieceAt(1, 1) == '_') {
            board.placePieceAt(1, 1, piece);
            return "1 1";
        }

        // iterate through the 2d array
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (board.getPieceAt(i, j) == '_') {
                    potential = check_potential(board, i, j, piece);
                    // return you can win directly
                    if (potential >= 2) {
                        board.placePieceAt(i, j, piece);
                        return i.toString() + " " + j.toString();
                    }

                    // Check the threat, which is the opponent's potential on this position
                    if (piece == 'X') {
                        threat = check_potential(board, i, j, 'O');
                    } else if (piece == 'O') {
                        threat = check_potential(board, i, j, 'X');
                    }

                    // High threat
                    if (threat >= 2) {
                        row = i;
                        col = j;
                        largestThreat = threat;
                        continue;

                    }
                    // When the position has more potential than all previous
                    if (largestThreat < 2 && potential >= largestPotential) {
                        row = i;
                        col = j;
                        largestPotential = potential;
                    }
                }
            }
        }
        board.placePieceAt(row, col, piece);
        return row.toString() + " " + col.toString();

    }

    /*---------------------------------------------------------------------------------------
     * This function checks the winning potential of a position.
     * @param board an instance of Board where the game is played on.
     * @param x the x index of the position, an int.
     * @param y the y index of the position, an int.
     * @param piece the piece type this function should check winning potential for, a String.
     * @return the winning potential at the position if you place a piece there, an int.
     *---------------------------------------------------------------------------------------*/
    int check_potential(Board board, int x, int y, String piece) {
        int potentialPointRow = 0;
        int potentialPointCol = 0;
        int potentialPointDia = 0;
        for (int i = 0; i < 3; i++) {
            // check row
            if (board.getPieceAt(x, i) == piece && potentialPointRow != -1) {
                potentialPointRow += 1;
            } else if (board.getPieceAt(x, i) != '_') {
                potentialPointRow = -1;
            }
            // check col
            if (board.getPieceAt(i, y) == piece && potentialPointCol != -1) {
                potentialPointCol += 1;
            } else if (board.getPieceAt(i, y) != '_') {
                potentialPointCol = -1;
            }
        }
        // check diagonal
        if ((x + y) % 2 == 0) {
            if (board.getPieceAt(1, 1) != piece) {
                potentialPointDia = -1;
            } else if (board.getPieceAt(2 - x, 2 - y) == piece) {
                potentialPointDia += 2;
            } else if (board.getPieceAt(2 - x, 2 - y) == '_') {
                potentialPointDia += 1;
            } else {
                potentialPointDia = -1;
            }
        }

        // Return the largest potential point
        if (potentialPointCol >= potentialPointDia && potentialPointCol >= potentialPointRow) {
            return potentialPointCol;
        } else if (potentialPointDia >= potentialPointCol && potentialPointDia >= potentialPointRow) {
            return potentialPointDia;
        }
        return potentialPointRow;

    }

}