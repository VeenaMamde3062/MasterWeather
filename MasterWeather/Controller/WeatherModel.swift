//
//  WeatherModel.swift
//  MasterWeather
//
//  Created by user235115 on 4/17/23.
//

import Foundation

struct WeatherModel: Decodable {
    let time: String
    let mintemp : String
    let maxtemp : String
    let humidity: String
    let condition: String

}
