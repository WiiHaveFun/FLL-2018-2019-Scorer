//
//  ScoringViewController.swift
//  FLL 2018-2019 Scorer
//
//  Created by Michael Chen on 9/11/18.
//  Copyright © 2018 Michael Chen. All rights reserved.
//

import UIKit

class ScoringViewController: UIViewController {
    
    let mi03Title = UILabel(frame: CGRect(x: 10.0, y: 630.0, width: 748.0, height: 36.0))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        missionImageViews[0].image = UIImage(named: "M01")
        missionImageViews[1].image = UIImage(named: "M02")
        
        mi03Title.text = "M03 - 3D Printing"
        mi03Title.font = mi03Title.font.withSize(30.0)
        // add subview first before adding constraints
        scrollView.addSubview(mi03Title)
        let leadingLabelConstraint = NSLayoutConstraint(item: mi03Title, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingLabelConstraint = NSLayoutConstraint(item: mi03Title, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 10.0)
//        let topLabelConstraint = NSLayoutConstraint(item: mi03Title, attribute: .top, relatedBy: .equal, toItem: missionScores[1], attribute: .bottom, multiplier: 1.0, constant: -8.0)
        
        view.addConstraints([leadingLabelConstraint, trailingLabelConstraint])
        
    }
    
    var round = Round()
    
//M01
    
    @IBOutlet var mi01SegControls: [UISegmentedControl]!
    
    @IBAction func mi01SegAction(_ sender: UISegmentedControl) {
        if let indexOfControl = mi01SegControls.index(of: sender) {
//            print("index of UI = \(indexOfControl)")
//            print("control's selected index = \(sender.selectedSegmentIndex)")
            if (indexOfControl == 0) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM01_01Done = true
                } else {
                    round.isM01_01Done = false
                }
            } else if (indexOfControl == 1) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM01_02Done = true
                } else {
                    round.isM01_02Done = false
                }
            } else if (indexOfControl == 2) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM01_03Done = true
                    
                } else {
                    round.isM01_03Done = false
                }
            }
            missionScores[0].text = "Score: \(round.M01_01Score + round.M01_02Score + round.M01_03Score)"
            totalScore.text = "Score: \(round.getTotalScore())"
        }
    }
    
    
//M02
    
    @IBOutlet var mi02SegControls: [UISegmentedControl]!
    
    @IBAction func mi01SegControls(_ sender: UISegmentedControl) {
        if let indexOfControl = mi02SegControls.index(of: sender) {
            if (indexOfControl == 0) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM02_01Done = true
                } else {
                    round.isM02_01Done = false
                }
            } else if (indexOfControl == 1) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM02_02Done = true
                } else {
                    round.isM02_02Done = false
                }
            }
            missionScores[1].text = "Score: \(round.M02_01Score + round.M02_02Score)"
            totalScore.text = "Score: \(round.getTotalScore())"
        }
    }
    
    
//M03
    

    
    
//Individual Mission Score Labels
    
    @IBOutlet var missionScores: [UILabel]!
    
//Total Score Label
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet var missionImageViews: [UIImageView]!
    
    @IBOutlet weak var scrollView: UIScrollView!
}

