/* ================================================================================
 * An instance of this class represent a player
 * Author: Hanwei Li and Evan Kuo
 *=================================================================================*/
class Player{
    String color;
    bool isAI;

    //== The constructor. initialize the piece color for this player and if its AI ==
    Player(color, isAI){
        this.color = color;
        this.isAI = isAI;
    }
}