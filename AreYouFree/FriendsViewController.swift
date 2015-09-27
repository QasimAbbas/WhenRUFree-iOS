//
//  FriendsViewController.swift
//  AreYouFree
//
//  Created by Qasim Abbas on 9/27/15.
//  Copyright © 2015 Qasim Abbas. All rights reserved.
//

import UIKit
import MapKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        
        //-----------down swipe gestures in view--------------//
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("rightSwiped"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeDown)
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 51.5033630, longitude: -0.1276250)
        
        let regionRadius: CLLocationDistance = 20
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
        centerMapOnLocation(initialLocation)

        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func venmo(sender: AnyObject) {
        
        var url  = NSURL(string: "https://itunes.apple.com/us/app/venmo/id351727428?mt=8"); // Change the URL with your URL Scheme
        if UIApplication.sharedApplication().canOpenURL(url!) == true
        {
            UIApplication.sharedApplication().openURL(url!)
        }
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
