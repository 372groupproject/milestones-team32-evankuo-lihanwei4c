void main(){
    print(fib(1));
    print(fib(2));
    print(fib(3));
    print(fib(4));
    print(fib(5));
    print(fib(6));
    print(fib(7));
}

// a function return ith fibonacci number
int fib(int index){
    if(index <= 0){
        return 0;
    }
    else if(index == 1){
        return 1;
    }
    
    return fibHelper(index - 1, 0, 1);
}

int fibHelper(int index, int prev2, int prev){
    if(index == 0){
        return prev;
    }
    return fibHelper(index - 1, prev, prev2 + prev);
}