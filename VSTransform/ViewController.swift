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
    let segment = UISegmentedControl(items: ["translate", "scale", "rotate"])
    var whichView = 0
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

        
//        imageView.transform = CGAffineTransformRotate(imageView.transform, CGFloat(M_PI/4))
//        imageView.transform = CGAffineTransformTranslate(imageView.transform, 100, 150)
//        imageView.transform = CGAffineTransformScale(imageView.transform, 1, 2)
//        imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI/2)
//        imageView.transform = CGAffineTransformMakeRotation(M_PI/2)
        
        switchButton.frame = CGRect(x: screenSize.width/2 - 30, y: 20, width: 20, height: 20)
        segment.frame = CGRect(x: screenSize.width/2 - 100, y: 100, width: 200, height: 40)
        
        slider1.frame = CGRect(x: screenSize.width/2 - 100, y: 200, width: 200, height: 20)
        slider2.frame = CGRect(x: screenSize.width/2 - 100, y: 250, width: 200, height: 20)

        bottomView.addSubview(switchButton)
        bottomView.addSubview(segment)
        bottomView.addSubview(slider1)
        bottomView.addSubview(slider2)
        slider2.hidden = true
        
        switchButton.addTarget(self, action: #selector(clock), forControlEvents: .ValueChanged)
        
        segment.addTarget(self, action: #selector(optionsInView), forControlEvents: .ValueChanged)

        slider1.addTarget(self, action: #selector(sliderValueChanged), forControlEvents: .ValueChanged)
        slider2.addTarget(self, action: #selector(sliderValueChanged), forControlEvents: .ValueChanged)
        
    }
    
    func sliderValueChanged(sender: UISlider) {
        print("hello")
        print(whichView)
        if whichView == 0 {
            slider1.addTarget(self, action: #selector(translateBoxX), forControlEvents: .ValueChanged)
            slider2.addTarget(self, action: #selector(translateBoxY), forControlEvents: .ValueChanged)
        } else if whichView == 1 {
            slider1.addTarget(self, action: #selector(scaleBoxX), forControlEvents: .ValueChanged)
            slider2.addTarget(self, action: #selector(scaleBoxY), forControlEvents: .ValueChanged)
        } else if whichView == 2 {
            slider1.addTarget(self, action: #selector(rotateBox), forControlEvents: .ValueChanged)
            //            slider2.addTarget(self, action: #selector(translateBoxY), forControlEvents: [.TouchUpOutside, .ValueChanged])
        }
    }
 
    
    func clock() {
        print(wise)
        wise *= -1
    }
    
    func optionsInView(sender: UISegmentedControl) {
        whichView = sender.selectedSegmentIndex
        if sender.selectedSegmentIndex == 0 {
            slider2.hidden = false
        } else if sender.selectedSegmentIndex == 1 {
            slider2.hidden = false
        } else if sender.selectedSegmentIndex == 2 {
            slider2.hidden = true
        }
        
    }

    func translateBoxX() {
        slider1.userInteractionEnabled = false
        UIView.animateWithDuration(2, delay: 0, options: [], animations: {
//            self.boxView.transform = CGAffineTransformTranslate(self.boxView.transform,)
            self.boxView.transform = CGAffineTransformMakeTranslation( CGFloat(self.slider1.value-0.5)*10, 0)
        })  { (completed) in
            if completed {
                self.slider1.userInteractionEnabled = true
            }
            
        }
        
    }
    
    func translateBoxY() {
        slider2.userInteractionEnabled = false
        UIView.animateWithDuration(2, delay: 0, options: [], animations: {
//            self.boxView.transform = CGAffineTransformTranslate(self.boxView.transform, 0, CGFloat(self.slider2.value-0.5)*10)
            self.boxView.transform = CGAffineTransformMakeTranslation( 0, CGFloat(self.slider2.value-0.5)*10)
        })  { (completed) in
            if completed {
                self.slider2.userInteractionEnabled = true
            }
            
        }
        
    }

    func scaleBoxX() {
        UIView.animateWithDuration(2, delay: 0, options: [], animations: {
            self.boxView.transform = CGAffineTransformMakeScale(CGFloat(self.slider1.value+1), 1)
        })  { (completed) in
            if completed {
                self.navigationController?.navigationBar.userInteractionEnabled = true
            }
        }
    }
    
    func scaleBoxY() {
        UIView.animateWithDuration(2, delay: 0, options: [], animations: {
            self.boxView.transform = CGAffineTransformMakeScale(1, CGFloat(self.slider2.value+1))
        })  { (completed) in
            if completed {
                self.navigationController?.navigationBar.userInteractionEnabled = true
            }
        }
    }
    
    
    func rotateBox() {
//        self.boxView.transform = CGAffineTransformRotate(boxView.transform, CGFloat(slider1.value)*CGFloat(wise))
        self.boxView.transform = CGAffineTransformMakeRotation(CGFloat(slider1.value)*CGFloat(wise))
    }
    
    
    
    //    func transform() {
    ////        sender.selectedSegmentIndex
    //            //print(slider1.value)
    //        if segment.selectedSegmentIndex == 0 {
    ////            translateBox()
    //        } else if segment.selectedSegmentIndex == 1 {
    //            scaleBox()
    //        } else if segment.selectedSegmentIndex == 2 {
    //            rotateBox()
    //        }
    //        //searchRadius = (int)searchRadiusSlider.value;
    //
    ////                segment.targetForAction(#selector(translate), withSender: 0)
    ////                segment.targetForAction(#selector(scale), withSender: 1)
    ////                segment.targetForAction(#selector(rotate), withSender: 2)
    //
    //    }
    
    //    func translateBox() {
    //        slider1.userInteractionEnabled = false
    //        UIView.animateWithDuration(2, delay: 0, options: [], animations: {
    //            //self.boxView.frame = CGRect(x: self.boxView.frame.origin.x + 20, y: self.boxView.frame.origin.y, width: 40, height: 40)
    ////self.boxView.transform = CGAffineTransformTranslate(self.boxView.transform, CGFloat(self.slider1.value+1)*(self.boxView.frame.origin.x + 1), self.boxView.frame.origin.y)
    ////self.boxView.transform = CGAffineTransformTranslate(self.boxView.transform,  self.boxView.frame.origin.x, CGFloat(self.slider2.value+1)*(self.boxView.frame.origin.y))
    ////            if self.slider1.selecte
    //            self.boxView.transform = CGAffineTransformTranslate(self.boxView.transform, CGFloat(self.slider1.value+1)*10, 0)
    //
    //            self.boxView.transform = CGAffineTransformTranslate(self.boxView.transform, 0, CGFloat(self.slider2.value+1)*10)
    //
    //
    //
    //        })  { (completed) in
    //            if completed {
    //                self.navigationController?.navigationBar.userInteractionEnabled = true
    //                self.slider1.userInteractionEnabled = true
    //            }
    //    
    //        }
    //        print(boxView.frame.origin)
    //       // print(boxView.frame.size)
    //        
    //    }

    
    
    //    func scaleBox() {
    //        UIView.animateWithDuration(2, delay: 0, options: [], animations: {
    //            //self.boxView.frame = CGRect(x: self.boxView.frame.origin.x + 20, y: self.boxView.frame.origin.y, width: 40, height: 40)
    //
    //           // self.boxView.transform = CGAffineTransformScale(self.boxView.transform, CGFloat(self.slider1.value+1), 1)
    //            self.boxView.transform = CGAffineTransformMakeScale(CGFloat(self.slider1.value+1), 1)
    //            self.boxView.transform = CGAffineTransformMakeScale(1, CGFloat(self.slider2.value+1))
    //
    //            //self.boxView.transform = CGAffineTransformScale(self.boxView.transform, 40, CGFloat(self.slider2.value+1)*40)
    //
    //        })  { (completed) in
    //            if completed {
    //                self.navigationController?.navigationBar.userInteractionEnabled = true
    //            }
    //
    //        }
    //        print(slider1.value + 1)
    //    }
    
}

