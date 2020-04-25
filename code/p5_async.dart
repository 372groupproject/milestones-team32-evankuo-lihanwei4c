Future<void> syncCount(int i) {
    // Imagine that this function is fetching user info from another service or database
    return Future.delayed(Duration(seconds: 1), () => print(i.toString()));
}

Future<void> asyncCount(int i) async{
    // Imagine that this function is fetching user info from another service or database
    return await Future.delayed(Duration(seconds: 1), () => print(i.toString()));
}

void main() async{
    print("Counting to ten synchronously...");
    for (var i = 1; i <= 10; i++){
        syncCount(i);
    }
    
    print('Counting to ten asynchronous...');
    for (var i = 1; i <= 10; i++){
        await asyncCount(i);
    }
}