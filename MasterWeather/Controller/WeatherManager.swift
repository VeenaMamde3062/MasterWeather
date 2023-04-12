//
//  WeatherManager.swift
//  MasterWeather
//
//  Created by user235115 on 4/12/23.
//

import Foundation
struct WeatherManager {
    func parseJSON() -> [WeatherModel]?{
        let path = Bundle.main.path(forResource: "response", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do{
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WeatherData.self, from: jsonData)
            let minTemp1 = decodedData.forecast.forecastday[0].day.mintemp_c
            let maxTemp1 = decodedData.forecast.forecastday[0].day.maxtemp_c
            let humidity1 = decodedData.forecast.forecastday[0].day.avghumidity
            let condition1 = decodedData.forecast.forecastday[0].day.condition.text
            let time1 = decodedData.forecast.forecastday[0].hour[0].time
            let weather1 = WeatherModel(minTemp: minTemp1, maxTemp: maxTemp1, humidity: humidity1, condition: condition1, time: time1)
            let minTemp2 = decodedData.forecast.forecastday[1].day.mintemp_c
            let maxTemp2 = decodedData.forecast.forecastday[1].day.maxtemp_c
            let humidity2 = decodedData.forecast.forecastday[1].day.avghumidity
            let condition2 = decodedData.forecast.forecastday[1].day.condition.text
            let time2 = decodedData.forecast.forecastday[1].hour[0].time
            let weather2 = WeatherModel(minTemp: minTemp2, maxTemp: maxTemp2, humidity: humidity2, condition: condition2, time: time2)
            let minTemp3 = decodedData.forecast.forecastday[2].day.mintemp_c
            let maxTemp3 = decodedData.forecast.forecastday[2].day.maxtemp_c
            let humidity3 = decodedData.forecast.forecastday[2].day.avghumidity
            let condition3 = decodedData.forecast.forecastday[2].day.condition.text
            let time3 = decodedData.forecast.forecastday[2].hour[0].time
            let weather3 = WeatherModel(minTemp: minTemp3, maxTemp: maxTemp3, humidity: humidity3, condition: condition3, time: time3)
            return [weather1,weather2,weather3]
        }catch{
            print("error \(error)")
            return nil
        }
    }
}
