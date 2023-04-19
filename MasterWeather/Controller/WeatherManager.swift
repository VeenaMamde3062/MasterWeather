//
//  WeatherManager.swift
//  MasterWeather
//
//  Created by user235115 on 4/12/23.
//

import Foundation
import SwiftyJSON
import Alamofire




struct WeatherManager {

    let weatherURL = "https://api.weatherapi.com/v1/history.json"
    func requestInfo(q: String, dt: String, end_dt: String, lang: String, hour: String){
        let parameters: [String:String] = ["key":"bb29dfa5fe1b4049b7093333231704",
                                            
                                            "q": q,
                                           
                                           "dt": dt,
                                            
                                            "end_dt": end_dt,
                                           
                                           "lang":lang,
                                           
                                            "hour":hour]
        Alamofire.request(weatherURL,method: .get,parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                print("Got Response")
                let weatherJSON : JSON = JSON(response.result.value!)
                let time = weatherJSON["forecast"]["forecastday"][0]["hour"][0]["time"].stringValue
                let minTemp = weatherJSON["forecast"]["forecastday"][0]["day"]["mintemp_c"].stringValue
                let maxTemp = weatherJSON["forecast"]["forecastday"][0]["day"]["maxtemp_c"].stringValue
                let humidity = weatherJSON["forecast"]["forecastday"][0]["day"]["avghumidity"].stringValue
                let condition = weatherJSON["forecast"]["forecastday"][0]["day"]["condition"]["text"].stringValue
                let weather = WeatherModel(time: time, mintemp: minTemp, maxtemp: maxTemp, humidity: humidity, condition: condition)
                var masterVC = MasterViewController()
//                masterVC.didUpdateWeather(self, weather)
                masterVC.time1.text = "Time: \(weather.time)"
            }
        }
    }
}
