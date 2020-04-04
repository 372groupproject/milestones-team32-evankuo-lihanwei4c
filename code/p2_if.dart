void main() {

	// Set up x
	var x = 10;
	var xString = x.toString();

	// Print out a space at the beginning to make it look better
	print(" ");

	// If x is even, print out that x is even
	if (x % 2 == 0) {
		print("x is currently " + xString + " and it is an even number");
	}

	// Else, print out it is odd
	else {
		print("x is currently " + xString + " and it is an odd number");
	}

	
}