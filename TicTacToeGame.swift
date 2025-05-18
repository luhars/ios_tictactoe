import Foundation

class TicTacToeGame: ObservableObject {
    @Published var board = Array(repeating: "", count: 9)
    @Published var currentPlayer = "X"
    @Published var gameOver = false
    @Published var winner: String? = nil
    
    func makeMove(at position: Int) {
        guard !gameOver && board[position].isEmpty else { return }
        
        board[position] = currentPlayer
        
        if checkWin() {
            winner = currentPlayer
            gameOver = true
        } else if board.allSatisfy({ !$0.isEmpty }) {
            gameOver = true
            winner = nil // Draw
        } else {
            currentPlayer = currentPlayer == "X" ? "O" : "X"
        }
    }
    
    func checkWin() -> Bool {
        let winPatterns = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]
        
        for pattern in winPatterns {
            if board[pattern[0]] != "" &&
               board[pattern[0]] == board[pattern[1]] &&
               board[pattern[1]] == board[pattern[2]] {
                return true
            }
        }
        return false
    }
    
    func resetGame() {
        board = Array(repeating: "", count: 9)
        currentPlayer = "X"
        gameOver = false
        winner = nil
    }
} 