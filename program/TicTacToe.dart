import 'dart:io';
import 'Player.dart';
import 'AI.dart';
import 'Board.dart';
/* ================================================================================
 * The game loop and main function.
 * Author: Hanwei Li and Evan Kuo
 *=================================================================================*/
class TicTacToe{

    // Attributes
    Board board;
    AI gameAI;
    List<Player> players;
    
    //== The Constructor. Initialize board, ai, and players =======================
    TicTacToe(){
        board = new Board();
        gameAI = new AI();
        players = new List<Player>(2);
        players[0] = new Player('O', false);
        players[1] = new Player('X', true);
    }
    

    /*-------------------------------------------------------------------------------
     * Place the given piece on board with the current difficulty.
     * @return "row col", a String representing the position this ai placed piece at. 
     * @param piece - 'O' / 'X', a string representing the piece color/shape
     * @param board - the current Board object representing the board being played on
     *-------------------------------------------------------------------------------*/
    void gameLoop(){
        board.clearBoard();
        print("Welcome to TicTacToe!\n");
        
        // difficulty selection
        gameAI.easyMode = yesOrNo("Please choose difficulty", "easy", "hard");
        
        // select player order
        players[0].isAI = yesOrNo("Is player 1 AI?", 'y', 'n');
        players[1].isAI = yesOrNo("Is player 2 AI?", 'y', 'n');
        
        var curTurn = 0;
        while(true){
            board.printBoard();
            print("Player " + (curTurn + 1).toString() + "'s turn to play: ");
            if(players[curTurn].isAI){
                print(gameAI.play(players[curTurn].color, board));
            }
            else{
                var coord = stdin.readLineSync().split(' ');
                if(!board.placePieceAt(int.parse(coord[0]), int.parse(coord[1]), players[curTurn].color)){
                    print("Invalid position!");
                    continue;
                }
            }
            
            // Check game state
            switch(board.checkGameState()){
                // draw
                case -1:{
                    board.printBoard();
                    print("It's a draw!\n");
                    return;
                }
                break;
                
                // p1 win
                case 1:{
                    board.printBoard();
                    print("Player 1 (" + players[0].color + ") won!");
                    return;
                }
                break;
                
                // p2 win
                case 2:{
                    board.printBoard();
                    print("Player 2 (" + players[1].color + ") won!");
                    return;
                }
                break;
                
                // continue; change turn
                default:{
                    if(curTurn == 0){
                        curTurn = 1;
                    }else{
                        curTurn = 0;
                    }
                }
                break;
            }
        }
        
    }
    

}

//== The main function. Start a game ============================================
void main(){
    var game = new TicTacToe();

    // loop until player don't want to play anymore
    while(true){
        game.gameLoop();

        // whether to play another game
        if(yesOrNo("Do you want to play again?", 'y', 'n')){
            continue;
        }
        break;
    }
}
/*-------------------------------------------------------------------------------
 * Choose to answer a yes/no question, keep asking until valid answer given
 * @return  a boolean representing the answer you chose
 * @param question - a String representing the question being asked
 * @param yes - a String representing the 'yes' (True) answer to the question
 * @param no - a String representing the 'no' (False) answer to the question
 *-------------------------------------------------------------------------------*/
bool yesOrNo(String question, String yes, String no){
    String yn = "(" + yes + "/" + no + ")";
    print(question + yn);
    while(true){
        String answer = stdin.readLineSync();
        if (answer == yes){
            return true;
        }
        else if (answer == no){
            return false;
        }
        else{
            print("Invalid answer! Please answer again " + yn + ":");
        }
    }
}