//
//  ViewController.swift
//  VSTransform
//
//  Created by Sachin Lamba on 20/07/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var boxView = UIView()
    var wise = 1
    let switchButton = UISwitch()
    let slider1 = UISlider()
    let slider2 = UISlider()
    let segment = UISegmentedControl(items: ["translate", "scale", "rotate", "nil"])
    var currentState = UIView()
    
    var indicatorSegment = UISegmentedControl(items: ["Decrese", "Increase"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let topView = UIView(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: screenSize.height/2))
        let bottomView = UIView(frame: CGRect(x: 0, y: screenSize.height/2 , width: screenSize.width, height: screenSize.height/2))
    
        topView.backgroundColor = UIColor.orangeColor()
        bottomView.backgroundColor = UIColor.yellowColor()
        topView.clipsToBounds = true

        view.addSubview(topView)
        view.addSubview(bottomView)
        
        boxView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        boxView.backgroundColor = .redColor()
        topView.addSubview(boxView)

        switchButton.frame = CGRect(x: screenSize.width/2 - 30, y: 20, width: 20, height: 20)
        segment.frame = CGRect(x: screenSize.width/2 - 120, y: 100, width: 240, height: 40)
        indicatorSegment.frame = CGRect(x: screenSize.width/2 - 100, y: 220, width: 200, height: 20)
        
        slider1.frame = CGRect(x: screenSize.width/2 - 100, y: 190, width: 200, height: 20)
        slider2.frame = CGRect(x: screenSize.width/2 - 100, y: 250, width: 200, height: 20)
        
        bottomView.addSubview(switchButton)
        bottomView.addSubview(segment)
        bottomView.addSubview(slider1)
        bottomView.addSubview(slider2)
        bottomView.addSubview(indicatorSegment)
        indicatorSegment.hidden = true
        slider2.hidden = true
        
        switchButton.addTarget(self, action: #selector(clock), forControlEvents: .ValueChanged)

        segment.addTarget(self, action: #selector(optionsInView), forControlEvents: .ValueChanged)

        slider1.addTarget(self, action: #selector(checkSliderValue), forControlEvents: .ValueChanged)
        slider2.addTarget(self, action: #selector(checkSliderValue), forControlEvents: .ValueChanged)
        
    }
    
    func checkSliderValue(sender: UISlider) {
        if segment.selectedSegmentIndex == 0 && sender == slider1 {
            translateBoxX()
        } else if segment.selectedSegmentIndex == 0 && sender == slider2 {
            translateBoxY()
        } else if segment.selectedSegmentIndex == 1 && sender == slider1 {
            scaleBoxX()
        } else if segment.selectedSegmentIndex == 1 && sender == slider2 {
            scaleBoxY()
        } else if segment.selectedSegmentIndex == 2 && sender == slider1 {
            rotateBox()
        }

    }
    
    func clock() {
        print(wise)
        wise *= -1
    }
    
    func optionsInView(sender: UISegmentedControl) {
        currentState = boxView
        if sender.selectedSegmentIndex == 0 {
            indicatorSegment.hidden = true
            slider2.hidden = false
        } else if sender.selectedSegmentIndex == 1 {
            indicatorSegment.hidden = false
            slider2.hidden = false

        } else if sender.selectedSegmentIndex == 2 {
            indicatorSegment.hidden = true
            slider2.hidden = true
        }
    }

    func translateBoxX() {
            self.boxView.transform = CGAffineTransformTranslate(self.currentState.transform, CGFloat(self.slider1.value)*3, 0)
    }
    
    func translateBoxY() {
            self.boxView.transform = CGAffineTransformTranslate(self.currentState.transform, 0 , CGFloat(self.slider2.value)*3)
    }

    func scaleBoxX() {
            self.boxView.transform = CGAffineTransformScale(self.currentState.transform, CGFloat(self.slider1.value + 0.5), 1)
    }
    
    func scaleBoxY() {
        self.boxView.transform = CGAffineTransformScale(self.currentState.transform, 1, CGFloat(self.slider2.value + 0.5))
    }
    
    
    func rotateBox() {
        self.boxView.transform = CGAffineTransformRotate(self.currentState.transform, CGFloat(slider1.value)*CGFloat(M_PI))
    }
}

