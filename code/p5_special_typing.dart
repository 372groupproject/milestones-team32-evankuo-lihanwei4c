void main(){
    // compiler figure out what's the type during declaration
    var a = "2";
    var b = 2;
    print(a.runtimeType);
    print(b.runtimeType);
    
    // dynamic is similar to java Object class. It's the default type if not specified
    dynamic c = 2.3;
    List d = [2, 3, "2.3"];
    print(c.runtimeType);
    print(d.runtimeType);
}