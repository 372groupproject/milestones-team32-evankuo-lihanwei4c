void main(){
    Set s = {1, 2, 3};
    print(s);
    print(s.runtimeType);
    print(s.first);
    print(s.length);
    print(s.contains(2));

    Set<bool> sb = new Set();
    sb.add(2 > 3);
    sb.add(2 < 5);
    sb.add(2 == 2);
    print(sb);
    print(sb.length);
    print(sb.first);
    print(sb.runtimeType);

}
