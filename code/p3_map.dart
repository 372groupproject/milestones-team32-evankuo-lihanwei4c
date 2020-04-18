void main(){
    Map m = {'True': 1,
             'False': 0,
             'Not Sure': 2};
    print(m);
    print(m['True']);
    print(m.containsKey('Not Sure'));
    m.remove('Not Sure');
    print(m.containsKey('Not Sure'));
    m.clear();
    print(m);
    print(m.runtimeType);

    // map with type parameters
    Map<String, bool> map = new Map();
    map['yes'] = true;
    map['no'] = false;
    print(map.containsKey('yes'));
    print(map['yes']);
    print(map.runtimeType);

}
