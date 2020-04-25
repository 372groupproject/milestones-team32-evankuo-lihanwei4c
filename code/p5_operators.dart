void main(){
    var a;
    a ??= 5;
    print(a.toString());
    a ??= 3;
    print(a.toString());
    
    print(a is String);
    print(a is! String);
    print(a is int);
}