//
//  WeatherViewController.swift
//  MasterWeather
//
//  Created by user235115 on 4/11/23.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var mintemp2: UILabel!
    @IBOutlet weak var maxtemp2: UILabel!
    @IBOutlet weak var humidity2: UILabel!
    @IBOutlet weak var condition2: UILabel!
    @IBOutlet weak var mintemp3: UILabel!
    @IBOutlet weak var maxtemp3: UILabel!
    @IBOutlet weak var humidity3: UILabel!
    @IBOutlet weak var condition3: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var time3: UILabel!
    
    var weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let weather1 = weatherManager.parseJSON(){
            didUpdateWeather1(weather1[0])
            didUpdateWeather2(weather1[1])
            didUpdateWeather3(weather1[2])
        }
    }
    
    func didUpdateWeather1(_ weather: WeatherModel){
        DispatchQueue.main.async {
            self.minTempLabel.text = "Min Temp:  \(weather.minTempString)"
            self.maxTempLabel.text = "Max Temp: \(weather.maxTempString)"
            self.humidityLabel.text = "Humidity: \(weather.humidityString)%"
            self.conditionLabel.text = "Condition: \(weather.condition)"
            self.timeLabel.text = "Time: \(weather.time)"
        }
    }
    func didUpdateWeather2(_ weather: WeatherModel){
        DispatchQueue.main.async {
            self.mintemp2.text = "Min Temp:  \(weather.minTempString)"
            self.maxtemp2.text = "Max Temp: \(weather.maxTempString)"
            self.humidity2.text = "Humidity: \(weather.humidityString)%"
            self.condition2.text = "Condition: \(weather.condition)"
            self.time2.text = "Time: \(weather.time)"
        }
    }
    func didUpdateWeather3(_ weather: WeatherModel){
        DispatchQueue.main.async {
            self.mintemp3.text = "Min Temp:  \(weather.minTempString)"
            self.maxtemp3.text = "Max Temp: \(weather.maxTempString)"
            self.humidity3.text = "Humidity: \(weather.humidityString)%"
            self.condition3.text = "Condition: \(weather.condition)"
            self.time3.text = "Time: \(weather.time)"
        }
    }
    
}
