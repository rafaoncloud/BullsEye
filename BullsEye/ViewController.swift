//
//  ViewController.swift
//  BullsEye
//
//  Created by Rafael Henriques on 21/08/2018.
//  Copyright © 2018 rafaoncloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int!
    var targetValue: Int!
    var score: Int = 0
    var round: Int = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentSlideValueLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var roundLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound(isFirstRound: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        
        let scoreFromRound = updateScore()
        
        let title = titleBaseOnScorePerformed(score: scoreFromRound)
        
        //let message = "The current slider value is \(currentValue!)\nThe target value is \(targetValue!)\nScore obtained in this round \(scoreFromRound)"
        
        let message = "Bull's Eye value is \(targetValue!)\nThis round you got \(scoreFromRound) points."
        
        //Create Alert Dialog/Controller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //Create Action button to Alert Dialog/Controller
        //New Round is started when user clicks in Ok Button
        let action = UIAlertAction(title: "Ok", style: .default, handler: {action in self.buttonActionNewRound()})
        
        //Add the Action Button to the Alert Dialog
        alert.addAction(action)
        
        //Add the Alert Dialog to be present in the UIViewController
        //This fuction is Asynchronous Asynchronous Asynchronous does not wait by alert
        present(alert,animated: true, completion: nil)
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //Print Slider value to the console between a min and max value
        print("Slider Value: \(slider.value)")
        
        //Round the value instead of 6,66 = 6 -> 6,66 = 7
        let roundedValue = slider.value.rounded()
        
        //Print rounded slider value
        print("Rounded Slider Value: \(roundedValue)")
        
        //Cast the rouded Float to Int and assign to currentValue variable
        currentValue = Int(roundedValue)
        
        updateLabels()
    }
    
    func titleBaseOnScorePerformed(score: Int) -> String{
        if(score == 100){
            return "Perfect!"
        }else if(score >= 95){
            return "Almost Perfect!"
        }else if(score >= 90){
            return "Pretty Good!"
        }else{
            return "Not close enough!"
        }
    }
    
    func buttonActionNewRound(){
        startNewRound(isFirstRound: false)
    }
    
    func startNewRound(isFirstRound: Bool){
        currentValue = 50
        targetValue = Int(arc4random_uniform(101))
        
        //Assign the slider value. Cast from Int to Float
        slider.value = Float(currentValue)

        if(isFirstRound){
            score = 0
            round = 1
        }
        
        updateLabels()
    }
    
    func updateLabels(){
        
        //Display the slide value in a label
        currentSlideValueLbl.text = String(currentValue)
        roundLbl.text = String(round)
        scoreLbl.text = String(score)
    }
    
    ///The score the score from the current round
    ///Different between the target value and the current slide value
    func calculateScoreCurRound(targetValue: Int, currentValue: Int) -> Int{
        //Calculate the difference
        //The difference is absolute
        let difference = abs(targetValue - currentValue)
        
        return difference;
    }
    
    func updateScore() -> Int{
        
        //Calculate Score from this round
        let difference = calculateScoreCurRound(targetValue: targetValue, currentValue: currentValue)
        
        var scoreFromThisRound = 100 - difference
        
        if(scoreFromThisRound == 100){
            scoreFromThisRound += 100
        }
        else if(scoreFromThisRound >= 95){
            scoreFromThisRound += 50
        }
        else if(scoreFromThisRound >= 90){
            scoreFromThisRound += 25
        }
        
        //Update Score and Round
        score += scoreFromThisRound;
        round += 1
        
        return scoreFromThisRound
    }
    
    @IBAction func startNewGame(_ barButtonItem: UIBarButtonItem){
        startNewRound(isFirstRound: true)
    }
}

