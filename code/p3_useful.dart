import 'dart:io';
void main(){
    Map<String, List> students = new Map();
    while(true){
        print("what is your name?");
        String name = stdin.readLineSync();
        
        print("how many exams did you take for CSC372? ");
        int num_exams = int.parse(stdin.readLineSync());
    
        List<double> grades = new List(num_exams);
        for(var i = 0; i < num_exams; i++){
            print("what is your grade for exam" + i.toString() + "?");
            grades[i] = double.parse(stdin.readLineSync());
        }
        students[name] = grades;
        print("Add another student? (y/n)");
        var another = stdin.readLineSync();
        if(another != "y"){
            break;
        }
    }
    print(students);

}
