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
        
        let switchButton = UISwitch()
        switchButton.frame = CGRect(x: screenSize.width/2 - 30, y: 20, width: 20, height: 20)
        let segment = UISegmentedControl(items: ["translate", "scale", "rotate"])
        segment.frame = CGRect(x: screenSize.width/2 - 80, y: 100, width: 160, height: 40)
        let slider = UISlider()
        slider.frame = CGRect(x: screenSize.width/2 - 100, y: 200, width: 200, height: 20)
        
        bottomView.addSubview(slider)
        bottomView.addSubview(segment)
        bottomView.addSubview(switchButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

