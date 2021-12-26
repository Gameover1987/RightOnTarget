//
//  ViewController.swift
//  RughtOnTarget
//
//  Created by Вячеслав on 21.09.2021.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    
    var round: Int = 0
    
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkNumber() {
        if self.round == 0 {
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            self.round = 1
        }
        if self.round == 5 {
            // выводим информационное окно с результатами игры
            let alert = UIAlertController(title: "Игра окончена",
                                          message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        }
        else {
            let numSlider = Int(slider.value.rounded())
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - numSlider + self.number
            } else {
                self.points += 50
            }
            self.round += 1
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
    }

}

