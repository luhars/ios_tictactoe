# Tic Tac Toe SwiftUI

This is a simple Tic Tac Toe game built using SwiftUI.

## How to Run

1. Clone the repository.
2. Open the `TicTacToe.xcodeproj` file in Xcode (Note: You might need to infer the exact .xcodeproj file name or create one if it doesn't exist, standard practice is ProjectName.xcodeproj).
3. Select a simulator or a connected device.
4. Click the "Run" button (or press Command+R).

## Project Structure

- **`TicTacToeApp.swift`**: The main entry point of the application. It defines the app structure and sets up the initial view.
- **`ContentView.swift`**: Contains the main UI of the game, including the game board, player information, and the "Play Again" button. It uses `TicTacToeGame` to manage the game state.
- **`TicTacToeGame.swift`**: The game logic class. It manages the game board, current player, checks for wins or draws, and handles game reset functionality.

## How to Play

- The game is played on a 3x3 grid.
- Player X starts first.
- Players take turns placing their symbol (X or O) in an empty cell.
- The first player to get three of their symbols in a row (horizontally, vertically, or diagonally) wins.
- If all cells are filled and no player has won, the game is a draw.
- Click on an empty cell to make your move.
- After the game ends, click the "Play Again" button to start a new game.
