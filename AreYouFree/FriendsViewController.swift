//
//  FriendsViewController.swift
//  AreYouFree
//
//  Created by Qasim Abbas on 9/27/15.
//  Copyright © 2015 Qasim Abbas. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    override func viewDidLoad() {
        
        //-----------down swipe gestures in view--------------//
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("rightSwiped"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeDown)

        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func rightSwiped()
    {
        print("Swiped Right")
        [self .performSegueWithIdentifier("segueBack", sender: nil)];
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
