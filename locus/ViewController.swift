//
//  ViewController.swift
//  locus
//
//  Created by Manish Dua on 2019-09-18.
//  Copyright © 2019 Manish Dua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    var currentVal = 50
    var score = 0
    var targetValue = 0
    var round = 1
    var bonus = 0
    
    @IBOutlet weak var slideme: UISlider!
    @IBOutlet weak var TargetVal: UILabel!
    @IBOutlet weak var TxtScore: UILabel!
    @IBOutlet weak var TxtRound: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TxtScore.text = "\(score)"
        TxtRound.text = "\(round)"
        let roundedVal = slideme.value.rounded()
        currentVal = Int(roundedVal)
        NewRound()
        updateValues()
    }


    @IBAction func hitmeBttn(_ sender: UIButton) {
        
        let msg: String?
        var diff: Int
        diff = abs(currentVal - targetValue)
    
        if diff == 0 {
            bonus = 100
            msg = "Excellent match! Bonus 100"
        }else if diff == 1 {
            bonus = 50
            msg = "Almost hitted! Bonus 50"
        }else if diff < 10{
            bonus = 0
            msg = "Well tried"
        }else {
            msg = "Try again"
        }
        score +=  bonus
        round += 1
        
        let message = "You hitted : \(currentVal)" + "\n Your target was:\(targetValue)" + "\n The difference is: \(diff)"
        let alert = UIAlertController(title: msg ,message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler:{_ in self.updateValues()} )
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
        NewRound()
        
    }

    @IBAction func sliderMove(_ slideme: UISlider) {
            print(slideme.value)
            let roundedVal = slideme.value.rounded()
            currentVal = Int(roundedVal)
        
    }
    @IBAction func reset(_ sender: UIButton) {
        NewRound()
        score = 0
        round = 1
        bonus = 0
        updateValues()
    }
    func updateValues(){
        TargetVal.text = String(targetValue)
        TxtScore.text = String(score)
        TxtRound.text = String(round)
    }
    func NewRound(){
        bonus = 0
        targetValue = Int.random(in: 1...100)
        currentVal = 50
        slideme.value = Float(currentVal)
    }
}

