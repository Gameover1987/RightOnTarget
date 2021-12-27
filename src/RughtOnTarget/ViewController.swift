
import UIKit

class ViewController: UIViewController {
    
    private var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(secretNumber: game.currentSecretValue)
    }
    
    @IBAction func checkNumber() {

        game.calculateScore(value: Int(slider.value))
        
        if game.isGameEnded {
            showAlert()
            game.restartGame()
        } else {
            game.startNewRound()
            updateLabelWithSecretNumber(secretNumber: game.currentSecretValue)
        }
    }

    @IBAction func showNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Вы заработали \(game.score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func updateLabelWithSecretNumber(secretNumber: Int) {
        label.text = String(game.currentSecretValue)
    }
}

