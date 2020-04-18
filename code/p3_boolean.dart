void main(){
    // dart use bool as the keyword for Boolean
    bool isTrue = true;
    print(isTrue);

    // comparison gives bool
    var a = 13 > 4;
    print(a);
    print(a.runtimeType);
    var b = 11 == 11;
    print(b);
    print(b.runtimeType);

    // logical operators

    // and
    print(true && true);
    print(false && false);
    print(true && false);
    
    // or
    print(true || false);
    print(true || true);
    print(false || false);

    // not
    print(!true);
    print(!false);

    // short-circuit
    print(12 > 3 || 11 < 2);
    print(11 > 12 || 12 == 11);
}
