//
//  ViewController.swift
//  AreYouFree
//
//  Created by Qasim Abbas on 9/26/15.
//  Copyright © 2015 Qasim Abbas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var boxlanded = false;

    override func viewDidLoad() {
        boxGenerator()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func boxGenerator(){
        
        let imageName = "yourImage.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width * 0.15
        let screenHeight = screenSize.height * 0.33
        
        let square = UIView(frame: CGRect(x: screenWidth, y: 0, width: 225, height: 225))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom:screenHeight, right: 10.0)
        collision = UICollisionBehavior(items: [square])
        collision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(insets)
        animator.addBehavior(collision)
        
       


    }
    
    


}

