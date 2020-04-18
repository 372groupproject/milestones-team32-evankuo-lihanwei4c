void main(){
    // A string is declared with the keyword String
    String str = "Here";
    print(str);
    print("\n");

    // You can use both single quote or double quote for string
    str = 'Hello';
    print(str);
    print("\n");

    // String can be concatenated with +
    String strPlus = str + " World";
    print(strPlus);
    print("\n");

    // String can be multiplied by integer
    String strMult = str * 2;
    print(strMult);
    print("\n");

    // StringBuffer provide a way to construct strings efficiently
    // It is declared as an object with the keyword new
    StringBuffer strBuff = new StringBuffer();
    strBuff.write('Hello');
    strBuff.write("World");
    print("\n");

    // print automatically call toString method
    // strings in StringBuffer are only concatenated when toString is called
    print(strBuff);
    print(strBuff.length);
    print(strBuff.isEmpty);
    strBuff.clear();
    print(strBuff);
}
