void main() {
    int aInteger = 1;
    double aDouble = 1.1;
    print("A Integer: " + aInteger.toString());
    print("A Double: " + aDouble.toString());
    print("\n");

    var intSum = aInteger + aInteger;
    print("int + int: " + intSum.toString());
    print(intSum.runtimeType);
    print("\n");

    var intDoubleSum = aInteger + aDouble;
    print("int + double: " + intDoubleSum.toString());
    print(intDoubleSum.runtimeType);
    print("\n");

    var doubleSum = aDouble + aDouble;
    print("double + double: " + doubleSum.toString());
    print(doubleSum.runtimeType);
    print("\n");
}
