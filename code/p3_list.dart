void main(){
    // list initialized
    List l_0 = [1, 2, 3, 4];
    print(l_0);

    // list with new
    List l_1 = new List();
    print(l_1.length);
    l_1.add(1);
    l_1.add(2);
    print(l_1);

    // you can add element of different type
    l_1[1] = "5";
    print(l_1);

    // fixed length list
    List l_2 = new List(3);
    print(l_2.length);
    l_2[0] = 0;
    l_2[1] = 1;
    l_2[2] = 2;
    // l_2.add(3);  error
    // l_2.add(4);  error
    // l_2.add(5); // error
    print(l_2.length);
    // it is list of dynamic if no type given
    print(l_2.runtimeType);
    
    // list with parameter type
    List<int> l_3 = new List();
    l_3.add(1);
    l_3.add(2);
    // l_3.add("here"); would give an error
    print(l_3);
    print(l_3.runtimeType);
}
