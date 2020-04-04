void main() {

	var cscClass = "CSC372";

	print(" ");
	print("This program uses switch statments to make opinions about the CSC class you're taking.");
	print(" ");

	switch(cscClass) {

		case "CSC372": { print("CSC372 is a good class!"); }
		break;

		case "CSC345": { print("CSC345 is super hard!"); }
		break;

		case "CSC445": { print("CSC445 is really hard!!!"); }
		break;

		default: { print("I haven't heard of that class."); }
		break;

	}

}