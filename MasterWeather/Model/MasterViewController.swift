//
//  MasterViewController.swift
//  MasterWeather
//
//  Created by user235115 on 4/17/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class MasterViewController: UIViewController {

    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var mintemp1: UILabel!
    @IBOutlet weak var maxtemp1: UILabel!
    @IBOutlet weak var humidity1: UILabel!
    @IBOutlet weak var condition1: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var mintemp2: UILabel!
    @IBOutlet weak var maxtemp2: UILabel!
    @IBOutlet weak var humidity2: UILabel!
    @IBOutlet weak var condition2: UILabel!
    @IBOutlet weak var time3: UILabel!
    @IBOutlet weak var mintemp3: UILabel!
    @IBOutlet weak var maxtemp3: UILabel!
    @IBOutlet weak var humidity3: UILabel!
    @IBOutlet weak var condition3: UILabel!
    
    var weatherManager = WeatherManager()
    var q : String = ""
    var dt : String = ""
    var end_dt : String = ""
    var lang : String = ""
    var hour : String = ""
    var language: String = "en"
    override func viewDidLoad() {
        super.viewDidLoad()
        requestInfo(q, dt, end_dt, lang, hour)
    }
    let weatherURL = "https://api.weatherapi.com/v1/history.json"
    func requestInfo(_ q: String, _ dt: String, _ end_dt: String, _ lang: String, _ hour: String){
        if lang == "english"{
            language = "en"
        }else if lang == "hindi"{
            language = "hi"
        }
        let parameters: [String:String] = ["key":"bb29dfa5fe1b4049b7093333231704",

                                            "q": q,

                                           "dt": dt,

                                            "end_dt": end_dt,

                                           "lang":language,

                                            "hour":hour]
        Alamofire.request(weatherURL,method: .get,parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                print("Got Response")
                let weatherJSON : JSON = JSON(response.result.value!)
                let time1 = weatherJSON["forecast"]["forecastday"][0]["hour"][0]["time"].stringValue
                let minTemp1 = weatherJSON["forecast"]["forecastday"][0]["day"]["mintemp_c"].stringValue
                let maxTemp1 = weatherJSON["forecast"]["forecastday"][0]["day"]["maxtemp_c"].stringValue
                let humidity1 = weatherJSON["forecast"]["forecastday"][0]["day"]["avghumidity"].stringValue
                let condition1 = weatherJSON["forecast"]["forecastday"][0]["day"]["condition"]["text"].stringValue
                let weather1 = WeatherModel(time: time1, mintemp: minTemp1, maxtemp: maxTemp1, humidity: humidity1, condition: condition1)
                let time2 = weatherJSON["forecast"]["forecastday"][1]["hour"][0]["time"].stringValue
                let minTemp2 = weatherJSON["forecast"]["forecastday"][1]["day"]["mintemp_c"].stringValue
                let maxTemp2 = weatherJSON["forecast"]["forecastday"][1]["day"]["maxtemp_c"].stringValue
                let humidity2 = weatherJSON["forecast"]["forecastday"][1]["day"]["avghumidity"].stringValue
                let condition2 = weatherJSON["forecast"]["forecastday"][1]["day"]["condition"]["text"].stringValue
                let weather2 = WeatherModel(time: time2, mintemp: minTemp2, maxtemp: maxTemp2, humidity: humidity2, condition: condition2)
                let time3 = weatherJSON["forecast"]["forecastday"][2]["hour"][0]["time"].stringValue
                let minTemp3 = weatherJSON["forecast"]["forecastday"][2]["day"]["mintemp_c"].stringValue
                let maxTemp3 = weatherJSON["forecast"]["forecastday"][2]["day"]["maxtemp_c"].stringValue
                let humidity3 = weatherJSON["forecast"]["forecastday"][2]["day"]["avghumidity"].stringValue
                let condition3 = weatherJSON["forecast"]["forecastday"][2]["day"]["condition"]["text"].stringValue
                let weather3 = WeatherModel(time: time3, mintemp: minTemp3, maxtemp: maxTemp3, humidity: humidity3, condition: condition3)
                let weather = [weather1,weather2,weather3]
                self.didUpdateWeather(weather)
            }
        }
    }
    func didUpdateWeather(_ weather: [WeatherModel]){
        DispatchQueue.main.async {
            self.time1.text = "Time: \(weather[0].time)"
            self.mintemp1.text = "MinTemp: \(weather[0].mintemp)"
            self.maxtemp1.text = "MaxTemp: \(weather[0].maxtemp)"
            self.humidity1.text = "Humidity: \(weather[0].humidity)%"
            self.condition1.text = "Condition: \(weather[0].condition)"
            self.time2.text = "Time: \(weather[1].time)"
            self.mintemp2.text = "MinTemp: \(weather[1].mintemp)"
            self.maxtemp2.text = "MaxTemp: \(weather[1].maxtemp)"
            self.humidity2.text = "Humidity: \(weather[1].humidity)%"
            self.condition2.text = "Condition: \(weather[1].condition)"
            self.time3.text = "Time: \(weather[2].time)"
            self.mintemp3.text = "MinTemp: \(weather[2].mintemp)"
            self.maxtemp3.text = "MaxTemp: \(weather[2].maxtemp)"
            self.humidity3.text = "Humidity: \(weather[2].humidity)%"
            self.condition3.text = "Condition: \(weather[2].condition)"
        }
    }
}
