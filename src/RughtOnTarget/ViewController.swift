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
    
    var round: Int = 1
    
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("viewDidLoad")
        
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
    override func loadView() {
        super.loadView()
        
        print("loadView")
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "ver 1.1"
        
        self.view.addSubview(versionLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func checkNumber() {

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

    @IBAction func showNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(viewController, animated: true, completion: nil)
    }
}

