void main(){
    MyStack stack = new MyStack();
    stack.push(1);
    stack.push(2);
    stack.push(3);
    print(stack.isEmpty());
    print(stack.pop());
    print(stack.pop());
    print(stack.pop());
    print(stack.isEmpty());
}

class MyStack{
    List elements = new List();
    
    void push(dynamic e){
        elements.add(e);
    }
    
    dynamic pop(){
        dynamic e = peak(); 
        elements.removeAt(elements.length - 1);
        return e;
    }
    
    dynamic peak(){
        return elements.last;
    }
    
    bool isEmpty(){
        return elements.isEmpty;
    }
    
}