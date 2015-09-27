
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
    var labeltext = "";
    var label = UILabel(frame: CGRectMake(0, 0, 200, 31))

    override func viewDidLoad() {
        
        boxGenerator()
        
        //-----------left swipe gestures in view--------------//
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("downSwiped"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func boxGenerator(){
        
        labeltext = "Alex Jia"
        
        label = UILabel(frame: CGRectMake(0, 0, 200, 31))
        label.center = CGPointMake(160,80)
        label.textAlignment = NSTextAlignment.Center
        label.text = labeltext
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        self.view.addSubview(label)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width * 0.13
        let screenHeight = screenSize.height * 0.33
        
        let square = UIView(frame: CGRect(x: screenWidth, y: 0, width: 225, height: 225))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
    
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRectMake(0, 0, 245, 245));
        imageView.image = UIImage(named:"alex-image.jpg")
        square.addSubview(imageView)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom:screenHeight, right: 0)
        collision = UICollisionBehavior(items: [square])
        collision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(insets)
        animator.addBehavior(collision)
        
        //-----------down swipe gestures in view--------------//
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("rightSwiped"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeDown)
  

    }
    
    func otherBoxGenerator(){
        labeltext = "Roopesh"
        
        label = UILabel(frame: CGRectMake(0, 0, 200, 31))
        label.center = CGPointMake(160,80)
        label.textAlignment = NSTextAlignment.Center
        label.text = labeltext
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        self.view.addSubview(label)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width * 0.13
        let screenHeight = screenSize.height * 0.33
        
        let square = UIView(frame: CGRect(x: screenWidth, y: 0, width: 225, height: 225))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRectMake(0, 0, 245, 245));
        imageView.image = UIImage(named:"roop-image.jpg")
        square.addSubview(imageView)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom:screenHeight, right: 0)
        collision = UICollisionBehavior(items: [square])
        collision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(insets)
        animator.addBehavior(collision)
        
        //-----------down swipe gestures in view--------------//
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("rightSwiped"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeDown)
        
        
    }
    
    
    func rightSwiped()
    {
        print("Swiped Right")
        [self .performSegueWithIdentifier("hangSegue", sender: nil)];
        
    }
    
    func downSwiped(){
        otherBoxGenerator()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue is CustomSegue {
            (segue as! CustomSegue).animationType = .Push
        }
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        let segue = CustomUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        segue.animationType = .Push
        return segue
    }

    
    
    


}

