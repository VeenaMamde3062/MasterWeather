//
//  ViewController.swift
//  MasterWeather
//
//  Created by user235115 on 4/11/23.
//

import UIKit

class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func submitPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWeather", sender: self)
    }
}
