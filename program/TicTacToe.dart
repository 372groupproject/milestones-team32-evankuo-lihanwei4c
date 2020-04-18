import 'dart:io';
import 'Player.dart';
import 'AI.dart';
import 'Board.dart';
class TicTacToe{

    // Attributes
    Board board;
    AI gameAI;
    List<Player> players;
    
    // The Constructor
    TicTacToe(){
        board = new Board();
        gameAI = new AI();
        players = new List<Player>(2);
        players[0] = new Player('O', false);
        players[1] = new Player('X', true);
    }
    
    void gameLoop(){
        board.clearBoard();
        print("Welcome to TicTacToe!\n");
        
        // difficulty selection
        gameAI.easyMode = yesOrNo("Please choose difficulty", "easy", "hard");
        
        // select player order
        players[0].isAI = yesOrNo("Is player 1 AI?", 'y', 'n');
        players[1].isAI = yesOrNo("Is player 2 AI?", 'y', 'n');
        
        int gameState = -1;
        int curTurn = 0;
        while(true){
            board.printBoard();
            print("Player " + (curTurn + 1).toString() + "'s turn to play: ");
            if(players[curTurn].isAI){
                print(gameAI.play(players[curTurn].color, board));
            }
            else{
                var coord = stdin.readLineSync().split(' ');
                board.placePieceAt(int.parse(coord[0]), int.parse(coord[1]), players[curTurn].color);
            }
            
            // Check game state
            switch(board.checkGameState()){
                // draw
                case 0:{
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
        return false;
    }
}

void main(){
    var game = new TicTacToe();
    game.gameLoop();
}