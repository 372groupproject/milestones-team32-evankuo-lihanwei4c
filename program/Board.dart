class Board {

	// Internal representation for the board
	List theBoard = [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']];


	void clearBoard() {
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = 0; j < theBoard.length; j++) {
				theBoard[i][j] = '_';
			}
		}
	}

    String getPieceAt(row, col){
        return theBoard[row][col];
    }

	// Places a piece at the given position. Returns true if the piece was place successfully and false 
	// if not (the column was full).
	bool placePieceAt(int row, int column, String color) {

		if (theBoard[row][column] == '_') {
			theBoard[row][column] = color;
			return true;
		}


		return false;
	}


	// Checks whether or not someone has won or lost
	int checkGameState() {

		// Check for player win vertical
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = theBoard[0].length - 1; j >= 0; j--) {

				if (theBoard[j][i] == 'O') {
					if (j == 0) {
						return 1;
					}
				}

				else {
					break;
				}
			}
		}

		// Check for player win horizontal
		for (int i = 0; i < theBoard.length; i++) {

			for (int j = 0; j < theBoard[0].length; j++) {

				if (theBoard[i][j] == "O") {
					if (j == theBoard[0].length - 1) {
						return 1;
					}
				}

				else {
					break;
				}
			}
		}

		// Check for player win vertical top left to bottom right
		for (int i = 0; i < theBoard.length; i++) {
			if (theBoard[i][i] == "O") {
				if (i == theBoard[0].length - 1) {
					return 1;
				}
			}

			else {
				break;
			}
		}

		// Check for player win vertical top right to bottom left
		for (int i = theBoard.length - 1; i >= 0; i--) {
			if (theBoard[theBoard.length - 1 - i][i] == "O") {
				if (i == 0) {
					return 1;
				}
			}

			else {
				break;
			}
		}




		// Check for comp win vertical
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = theBoard[0].length - 1; j >= 0; j--) {

				if (theBoard[j][i] == "X") {
					if (j == 0) {
						return 2;
					}
				}

				else {
					break;
				}
			}
		}


		// Check for comp win horizontal
		for (int i = 0; i < theBoard.length; i++) {

			for (int j = 0; j < theBoard[0].length; j++) {

				if (theBoard[i][j] == "X") {
					if (j == theBoard[0].length - 1) {
						return 2;
					}
				}

				else {
					break;
				}
			}
		}

		// Check for comp win vertical top left to bottom right
		for (int i = 0; i < theBoard.length; i++) {
			if (theBoard[i][i] == "X") {
				if (i == theBoard[0].length - 1) {
					return 2;
				}
			}

			else {
				break;
			}
		}


		// Check for player win vertical top right to bottom left
		for (int i = theBoard.length - 1; i >= 0; i--) {
			if (theBoard[i][i] == "X") {
				if (i == 0) {
					return 2;
				}
			}

			else {
				break;
			}
		}

		// Check for draw
		bool doContinue = true;
		for (int i = 0; i < theBoard.length; i++) {

			for (int j = 0; j < theBoard.length; j++) {

				if (doContinue == true) {

					if (theBoard[i][j] == "_") {
						doContinue = false;
					}

					else {
						if (i == theBoard.length - 1 && j == theBoard.length - 1) {
							return -1;
						}
					}
				}
			}
		}


		return 0;
	}

	// Print out the board
	void printBoard() {

		for (int i = 0; i < theBoard.length; i++) {

			String printOneRow = "";

			for (int j = 0; j < theBoard[i].length; j++) {
                printOneRow = printOneRow + theBoard[i][j] + " ";
			}

			print(printOneRow);

		}

	}


}