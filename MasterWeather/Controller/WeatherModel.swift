//
//  WeatherModel.swift
//  MasterWeather
//
//  Created by user235115 on 4/12/23.
//

import Foundation

struct WeatherModel {
    let minTemp: Double
    let maxTemp: Double
    let humidity: Double
    let condition: String
    let time: String
    var minTempString: String{
        return String(format: "%.1f", minTemp)
    }
    var maxTempString: String{
        return String(format: "%.1f", maxTemp)
    }
    var humidityString: String{
        return String(format: "%.0f", humidity)
    }
}
