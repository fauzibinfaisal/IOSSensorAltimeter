//
//  ViewController.swift
//  IOSSensorAltimeter
//
//  Created by Fauzi Fauzi on 07/07/19.
//  Copyright © 2019 Fauzi. All rights reserved.
//

import UIKit

// TODO 1 : import CoreMotion
import CoreMotion

class ViewController: UIViewController {
    
    //TODO 2 : Initialize CMAltimeter
    let altimeter = CMAltimeter()
    @IBOutlet weak var relatitveAltitudeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startAction(_ sender: Any) {
        //TODO 3 : Check sensor availibity
        if CMAltimeter.isRelativeAltitudeAvailable(){
            
            // TODO 4 : Start altimeter and create what to do with the data
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { (data, error) in
                print(data!)
                
                //altitude : meters, pressure: kilopascal -> hPa , multiple 10
                
                self.relatitveAltitudeLabel.text = String.init(format: "Altitude: %.2f M", (data?.relativeAltitude.floatValue)!)
                self.pressureLabel.text = String.init(format: "Pressure: %.2f hPA", (data?.pressure.floatValue)!*10)
            }
        }
    }
    
    @IBAction func stopAction(_ sender: Any) {
        altimeter.stopRelativeAltitudeUpdates()
    }
}

