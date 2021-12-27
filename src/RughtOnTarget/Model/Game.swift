
import Foundation

public protocol GameProtocol {
    // количество заработанных очков
    var score: Int { get }
    
    // загаданное число
    var currentSecretValue: Int { get }
    
    // проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    
    // начинает новую игру
    func restartGame()
    
    // начинает новый раунд
    func startNewRound()
    
    // сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(value: Int)
}

class Game: GameProtocol {
    
    var score: Int = 0
    
    private var minSecretValue: Int
    private var maxSecretaValue: Int
    
    var currentSecretValue: Int = 0
    
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
       return currentRound >= lastRound
    }
    
    init(startValue: Int, endValue: Int, rounds: Int) {
        if startValue >= endValue {
            fatalError("StartValue(\(startValue) >= EndValue(\(endValue)")
        }
        
        minSecretValue = startValue
        maxSecretaValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    private func getNewSecretValue() -> Int {
        return Int.random(in: minSecretValue...maxSecretaValue)
    }
    
    func calculateScore(value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - value + currentSecretValue
        } else {
            score += 50
        }
    }
}
