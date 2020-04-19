import 'package:equatable/equatable.dart';

// Compare if books are the same
void main(){
    Book b1 = new Book("Dart", "Hanwei", 12.5, 1);
    Book b2 = new Book("Dart", "Hanwei", 19, 2);
    Book b3 = new Book("Dart", "Evan", 12.5, 1);
    print(b1 == b2);
    print(b1 == b3);
}

// Books are the same if their title and author are the same
class Book extends Equatable{
    String title;
    String author;
    double price;
    int edition;
    Book(String title, String author, double price, int edition){
        this.title = title;
        this.author = author;
        this.price = price;
        this.edition = edition;
    }
    
    @override
    List<Object> get props => [title, author];
    
    
}