//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBOutlet weak var titleHeader: UILabel!
    
    let edggTime = ["Soft":300,"Medium":420,"Hard":720]
    var timer = Timer()
    var totalTime = 0
    var secondPassed  = 0
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = edggTime[hardness]!
        ProgressBar.progress = 0.0
        secondPassed = 0
        
        
        titleHeader.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
 
    }

    
    @objc func updateTimer(){
        if secondPassed < totalTime {
            secondPassed += 1
            let percentageProgress = (Float(secondPassed) / Float(totalTime))
            ProgressBar.progress = (percentageProgress)
 
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
    
    
}
