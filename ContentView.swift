import SwiftUI

struct ContentView: View {
    @StateObject private var game = TicTacToeGame()
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text(game.gameOver ? gameOverMessage : "Current Player: \(game.currentPlayer)")
                    .font(.title2)
                    .fontWeight(.medium)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    ForEach(0..<9) { index in
                        CellView(symbol: game.board[index]) {
                            game.makeMove(at: index)
                        }
                    }
                }
                .padding()
                
                if game.gameOver {
                    Button(action: {
                        game.resetGame()
                    }) {
                        Text("Play Again")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
    
    private var gameOverMessage: String {
        if let winner = game.winner {
            return "Player \(winner) Wins!"
        } else {
            return "It's a Draw!"
        }
    }
}

struct CellView: View {
    let symbol: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(radius: 2)
                
                Text(symbol)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(symbol == "X" ? .blue : .red)
            }
        }
        .disabled(!symbol.isEmpty)
    }
}

#Preview {
    ContentView()
} 