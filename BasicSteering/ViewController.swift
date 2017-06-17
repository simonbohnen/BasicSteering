//
//  ViewController.swift
//  BasicSteering
//
//  Created by COD3LTA on 16.06.17.
//  Copyright © 2017 COD3LTA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var busbutton: UIButton!
    @IBOutlet var rbutton: UIButton!
    @IBOutlet var lbutton: UIButton!
    @IBOutlet var vbutton: UIButton!
    @IBOutlet var lzbutton: UIButton!
    @IBOutlet var vzbutton: UIButton!
    @IBOutlet var rzbutton: UIButton!
    
    var counter = 0
    /*
     counter-werte:
     -1: Autopilot aktiv
     0: Keine Bewegung
     1: geradeaus
     2: nach vorne links
     3: nach vorne rechts
     4: zurück
     5: nach hinten links (aus Sicht des "Fahrers")
     6: nach hinten rechts
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        counter = -1
        sendSignal()
    }
    
    func resetAllImageButtons() {
        if let image = UIImage(named: "lL.png") {
            lbutton.setImage(image, for: [])
        }
        if let image = UIImage(named: "rL.png") {
            rbutton.setImage(image, for: [])
        }
        if let image = UIImage(named: "vL.png") {
            vbutton.setImage(image, for: [])
        }
        if let image = UIImage(named: "lLZ.png") {
            lzbutton.setImage(image, for: [])
        }
        if let image = UIImage(named: "rLZ.png") {
            rzbutton.setImage(image, for: [])
        }
        if let image = UIImage(named: "vLZ.png") {
            vzbutton.setImage(image, for: [])
        }
    }
    
    @IBAction func busclicked(_ sender: Any) {
        resetAllImageButtons()
        counter = -1
        sendSignal()
    }
    @IBAction func stopclicked(_ sender: Any) {
        counter = 0
        resetAllImageButtons()
        sendSignal()
    }
    
    @IBAction func rightcklicked(_ sender: Any) {
        counter = 3
        resetAllImageButtons()
        if let image = UIImage(named: "rV.png") {
            rbutton.setImage(image, for: [])
        }
        sendSignal()
    }
    
    @IBAction func leftClicked(_ sender: Any) {
        counter = 2
        resetAllImageButtons()
        if let image = UIImage(named: "lV.png") {
            lbutton.setImage(image, for: [])
        }
        sendSignal()
    }
    
    @IBAction func aheadClicked(_ sender: Any) {
        counter = 1
        resetAllImageButtons()
        if let image = UIImage(named: "vV.png") {
            vbutton.setImage(image, for: [])
        }
        sendSignal()
    }
    
    @IBAction func rzclicked(_ sender: Any) {
        counter = 6
        resetAllImageButtons()
        if let image = UIImage(named: "rVZ.png") {
            rzbutton.setImage(image, for: [])
        }
        sendSignal()
    }
    
    @IBAction func lzclicked(_ sender: Any) {
        counter = 5
        resetAllImageButtons()
        if let image = UIImage(named: "lVZ.png") {
            lzbutton.setImage(image, for: [])
        }
        sendSignal()
    }
    
    @IBAction func vzclicked(_ sender: Any) {
        counter = 4
        resetAllImageButtons()
        if let image = UIImage(named: "vVZ.png") {
            vzbutton.setImage(image, for: [])
        }
        sendSignal()
    }
    
    func sendSignal() {
        var request = URLRequest(url: URL(string: "https://io.adafruit.com/api/groups/myvalues/send.json?x-aio-key=e03b7fcf6e7c41cab6fc57db7b2102ec&counter=" + String(counter))!)
        request.httpMethod = "POST"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            print("senden...")
            }.resume()
    }
}

