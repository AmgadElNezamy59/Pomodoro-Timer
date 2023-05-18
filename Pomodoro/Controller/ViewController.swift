//  ViewController.swift
//  Pomodoro
//  Created by Amgad ElNezamy on 15/12/2022.
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerValue: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var completeImage: UIImageView!
    
    let countDown = ["20 Min":12 , "25 Min":5 , "30 Min":1800]
    var totalTime = 0
    var secondPassed = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeImage.image = UIImage(named:"")
        progressBar.progress =  0.0

    }

    @IBAction func TimerChange(_ sender: UISegmentedControl) {
        timer.invalidate()
        let SelectedTime = sender.selectedSegmentIndex
        if SelectedTime == 0 {
            totalTime = countDown["20 Min"]!
        }else if SelectedTime == 1{
            totalTime = countDown["25 Min"]!
        }else {
            totalTime = countDown["30 Min"]!
        }
        completeImage.image = UIImage(named:"")
        progressBar.progress =  0.0
        secondPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
       
    }
    
    @objc func updateCounter() {
        if secondPassed < totalTime{
            secondPassed+=1
            let timeRemaining = totalTime - secondPassed
            timerValue.text =   timeString(time: TimeInterval(timeRemaining))

            let percentageProgress = Float(secondPassed) / Float(totalTime)
            
            progressBar.progress =  percentageProgress
            
        }else{
            completeImage.image = UIImage(named:"Completed")

            }
        }
    
    func timeString(time: TimeInterval) -> String {
        let hour = Int(time) / 3600
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60

        // return formated string
        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
}

