import 'package:equatable/equatable.dart';
import 'dart:io';
void main(){
    List<Book> books = new List<Book>();
    books.add(new Book('Dart Tutorial', 'Hanwei', 12.5, 1));
    books.add(new Book('Dart Tutorial', 'Evan', 18, 2));
    books.add(new Book('Dart Tutorial', 'Hanwei', 14, 2));
    books.add(new Book('Haskell Tutorial', 'Hanwei', 15.5, 4));
    books.add(new Book('Dart Tutorial', 'Evan', 13.5, 1));
    books.add(new Book('Haskell Tutorial', 'Hanwei', 11.1, 1));
    books.add(new Book('Scheme Tutorial', 'Hanwei', 10.5, 1));
    
    while(yesOrNo("Do you want to check a book?", 'y', 'n')){
        print("Input book title: ");
        var title = stdin.readLineSync();
        print("Input author: ");
        var author = stdin.readLineSync();
        CheckBook(books, title, author);
    }
}
bool yesOrNo(String question, String yes, String no){
    String yn = "(" + yes + "/" + no + ")";
    print(question + yn);
    while(true){
        String answer = stdin.readLineSync();
        if (answer == yes){
            return true;
        }
        else if (answer == no){
            return false;
        }
        else{
            print("Invalid answer! Please answer again " + yn + ":");
        }
    }
    return false;
}

void CheckBook(List books, title, author){
    var book = new Book(title, author, null, null);
    for (var i = 0; i < books.length; i++){
        if(books[i] == book){
            print('edition:' + books[i].edition.toString() + '  price:' + books[i].price.toString());
        }
    }
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