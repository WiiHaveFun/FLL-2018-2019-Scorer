//
//  ScoringViewController.swift
//  FLL 2018-2019 Scorer
//
//  Created by Michael Chen on 9/11/18.
//  Copyright © 2018 Michael Chen. All rights reserved.
//

import UIKit

class ScoringViewController: UIViewController {
    
    //Create mission UI Programically
    
    
    
    //M03
    let mi03Title = UILabel(frame: CGRect(x: 10.0, y: 630.0, width: 748.0, height: 36.0))
    let mi03_01Text = UITextView(frame: CGRect(x: 10.0, y: 666.0, width: 560.0, height: 100.0))
    let mi03_01Seg = UISegmentedControl(items: ["No", "Yes"])
    let mi03_02Text = UITextView(frame: CGRect(x: 10.0, y: 760.0, width: 560.0, height: 100.0))
    let mi03_02Seg = UISegmentedControl(items: ["No", "Yes"])
    let mi03Score = UILabel(frame: CGRect(x: 10.0, y: 854.0, width: 748.0, height: 36.0))
    
    //M04
    //M03
    let mi04Title = UILabel(frame: CGRect(x: 10.0, y: 898.0, width: 748.0, height: 36.0))
    let mi04_01Text = UITextView(frame: CGRect(x: 10.0, y: 934.0, width: 560.0, height: 100.0))
    let mi04_01Seg = UISegmentedControl(items: ["No", "Yes"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        missionImageViews[0].image = UIImage(named: "M01")
        missionImageViews[1].image = UIImage(named: "M02")
        addParamtersToUIM03()
        addParamtersToUIM04()
        mi03SegControls = [mi03_01Seg, mi03_02Seg]
    }
    
    override open var shouldAutorotate: Bool {
        return false
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
    
    func addParamtersToUIM03() {
        //Mission 3
        mi03Title.text = "M03 - 3D Printing"
        mi03Title.font = mi03Title.font.withSize(30.0)
        // add subview first before adding constraints
        scrollView.addSubview(mi03Title)
        let leadingLabelConstraint = NSLayoutConstraint(item: mi03Title, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingLabelConstraint = NSLayoutConstraint(item: mi03Title, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 10.0)
        view.addConstraints([leadingLabelConstraint, trailingLabelConstraint])
        
        mi03_01Text.text = "Is the 2x4 brick ejected and completely in the Northeast Planet Area?"
        mi03_01Text.font = UIFont.systemFont(ofSize: 20.0)
        mi03_01Text.isScrollEnabled = false
        mi03_01Text.isEditable = false
        mi03_01Text.isSelectable = false
        scrollView.addSubview(mi03_01Text)
        let leadingTextConstraint01 = NSLayoutConstraint(item: mi03_01Text, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingTextConstraint01 = NSLayoutConstraint(item: mi03_01Text, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 198.0)
        view.addConstraints([leadingTextConstraint01, trailingTextConstraint01])
        //don't forget to check each variable for typos. Remember .addTarget()
        mi03_01Seg.frame = CGRect(x: 244.0, y: 724.0, width: 280, height: 29)
        mi03_01Seg.selectedSegmentIndex = 0
        mi03_01Seg.addTarget(self, action: #selector(mi03SegAction), for: .valueChanged)
        scrollView.addSubview(mi03_01Seg)
        let leadingSegConstraint01 = NSLayoutConstraint(item: mi03_01Seg, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 244.0)
        let trailingSegConstraint01 = NSLayoutConstraint(item: mi03_01Seg, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 244.0)
        view.addConstraints([leadingSegConstraint01, trailingSegConstraint01])
        
        mi03_02Text.text = "Is the 2x4 brick ejected and not completely in the Northeast Planet Area?"
        mi03_02Text.font = UIFont.systemFont(ofSize: 20.0)
        mi03_02Text.isScrollEnabled = false
        mi03_02Text.isEditable = false
        mi03_02Text.isSelectable = false
        mi03_02Seg.addTarget(self, action: #selector(mi03SegAction), for: .valueChanged)
        scrollView.addSubview(mi03_02Text)
        let leadingTextConstraint02 = NSLayoutConstraint(item: mi03_02Text, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingTextConstraint02 = NSLayoutConstraint(item: mi03_01Text, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 198.0)
        view.addConstraints([leadingTextConstraint02, trailingTextConstraint02])
        
        mi03_02Seg.frame = CGRect(x: 244.0, y: 818.0, width: 280, height: 29)
        mi03_02Seg.selectedSegmentIndex = 0
        scrollView.addSubview(mi03_02Seg)
        let leadingSegConstraint02 = NSLayoutConstraint(item: mi03_02Seg, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 244.0)
        let trailingSegConstraint02 = NSLayoutConstraint(item: mi03_02Seg, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 244.0)
        view.addConstraints([leadingSegConstraint02, trailingSegConstraint02])
        
        mi03Score.text = "Score: 0"
        mi03Score.font = mi03Title.font.withSize(30.0)
        // add subview first before adding constraints
        scrollView.addSubview(mi03Score)
        let leadingScoreConstraint = NSLayoutConstraint(item: mi03Score, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingScoreConstraint = NSLayoutConstraint(item: mi03Score, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 10.0)
        view.addConstraints([leadingScoreConstraint, trailingScoreConstraint])
    }
    
    
    //M03 outlet
    var mi03SegControls: [UISegmentedControl] = []
    
    //M03 action
    @objc func mi03SegAction(sender: UISegmentedControl) {
        if let indexOfControl = mi03SegControls.index(of: sender) {
            if (indexOfControl == 0) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM03_01Done = true
                    mi03_02Seg.selectedSegmentIndex = 0
                } else {
                    round.isM03_01Done = false
                }
            } else if (indexOfControl == 1) {
                if (sender.selectedSegmentIndex == 1) {
                    round.isM03_02Done = true
                    mi03_01Seg.selectedSegmentIndex = 0
                } else {
                    round.isM03_02Done = false
                }
            }
            mi03Score.text = "Score: \(round.M03_01Score + round.M03_02Score)"
            totalScore.text = "Score: \(round.getTotalScore())"
        }
    }
    
    func addParamtersToUIM04() {
        //Mission 3
        mi04Title.text = "M04 - Crater Crossing"
        mi04Title.font = mi04Title.font.withSize(30.0)
        // add subview first before adding constraints
        scrollView.addSubview(mi04Title)
        let leadingLabelConstraint = NSLayoutConstraint(item: mi04Title, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingLabelConstraint = NSLayoutConstraint(item: mi04Title, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 10.0)
        view.addConstraints([leadingLabelConstraint, trailingLabelConstraint])
        
        mi04_01Text.text = "Has the weight-bearing features of the crossing equipment crossed the crater from east to west, making it COMPLETELY past the flattened gate?"
        mi04_01Text.font = UIFont.systemFont(ofSize: 20.0)
        mi04_01Text.isScrollEnabled = false
        mi04_01Text.isEditable = false
        mi04_01Text.isSelectable = false
        scrollView.addSubview(mi04_01Text)
        let leadingTextConstraint01 = NSLayoutConstraint(item: mi03_01Text, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 10.0)
        let trailingTextConstraint01 = NSLayoutConstraint(item: mi03_01Text, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 198.0)
        view.addConstraints([leadingTextConstraint01, trailingTextConstraint01])
        //don't forget to check each variable for typos. Remember .addTarget()
        mi04_01Seg.frame = CGRect(x: 244.0, y:  1042.0, width: 280, height: 29)
        mi04_01Seg.selectedSegmentIndex = 0
//        mi04_01Seg.addTarget(self, action: #selector(mi04SegAction), for: .valueChanged)
        scrollView.addSubview(mi04_01Seg)
        let leadingSegConstraint01 = NSLayoutConstraint(item: mi04_01Seg, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 244.0)
        let trailingSegConstraint01 = NSLayoutConstraint(item: mi04_01Seg, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 244.0)
        view.addConstraints([leadingSegConstraint01, trailingSegConstraint01])
    }
    
    
//Individual Mission Score Labels
    
    @IBOutlet var missionScores: [UILabel]!
    
//Total Score Label
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet var missionImageViews: [UIImageView]!
    
    @IBOutlet weak var scrollView: UIScrollView!
}

