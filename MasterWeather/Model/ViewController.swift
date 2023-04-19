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
    
    var datePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
//    var weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationField.delegate = self
        startDateField.delegate = self
        endDateField.delegate = self
        langField.delegate = self
        hourField.delegate = self
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWeather", sender: self)
//        if let location = locationField.text,let startDate = startDateField.text,let endDate = endDateField.text,let language = langField.text,let hour = hourField.text{
//            weatherManager.requestInfo(q: location, dt: startDate, end_dt: endDate, lang: language, hour: hour)
//        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeather"{
            let masterVC = segue.destination as! MasterViewController
            masterVC.q = locationField.text!
            masterVC.dt = startDateField.text!
            masterVC.end_dt = endDateField.text!
            masterVC.lang = langField.text!
            masterVC.hour = hourField.text!
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
