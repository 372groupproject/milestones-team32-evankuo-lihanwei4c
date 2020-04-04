void main() {
	
	print(" ");
	print("This program uses all of the control flow statements to create a program. This program will print out the factors of all numbers between first and last");

	var first = 2;
	var last = 12;

	var theList = new List();

	// for loop
	for (var i = first; i <= last; i++) {
		theList.add(i);
	}

	// for...in loop
	for (var num in theList) {

		var j = 1;
		var numString = num.toString();
		print("The multiples of " + numString + " are:");

		// while loop
		while (j <= num) {

			// if 
			if (num % j == 0) {
				print(j);
			}

			j = j + 1;
		}

		print(" ");

	}

	var total = last - first;
	var totalLessThanTen = total < 10;
	// switch statement
	switch(totalLessThanTen) {
		case true: { print("We found the factors of less than 10 numbers."); }
		break;

		default: { print("We found the factors of lots of numbers!"); }
		break;
	}

}