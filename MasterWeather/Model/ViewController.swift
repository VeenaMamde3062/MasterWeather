//
//  ViewController.swift
//  MasterWeather
//
//  Created by user235115 on 4/11/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var startDateField: UITextField!
    @IBOutlet weak var endDateField: UITextField!
    @IBOutlet weak var langField: UITextField!
    @IBOutlet weak var hourField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var datePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        locationField.delegate = self
        startDateField.delegate = self
        endDateField.delegate = self
        langField.delegate = self
        hourField.delegate = self
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        do{
            sleep(5)
        }
        activityIndicator.isHidden = true
        activityIndicator .stopAnimating()
        performSegue(withIdentifier: "goToWeather", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeather"{
            let weatherVC = segue.destination as! WeatherViewController
            weatherVC.q = locationField.text!
            weatherVC.dt = startDateField.text!
            weatherVC.end_dt = endDateField.text!
            weatherVC.lang = langField.text!
            weatherVC.hour = hourField.text!
            
        }
    }
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == startDateField || textField == endDateField{
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.datePickerMode = .date
            startDateField.inputView = datePicker
            endDateField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        }
    }
    @objc func dateSelected(){
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: datePicker.date)
        if startDateField.isFirstResponder{
            startDateField.text = date
        }else if endDateField.isFirstResponder{
            endDateField.text = date
        }

    }    
}
