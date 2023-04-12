//
//  WeatherData.swift
//  MasterWeather
//
//  Created by user235115 on 4/12/23.
//

import Foundation

struct WeatherData : Decodable{
    let forecast: Forecast
}
struct Forecast: Decodable {
    let forecastday: [Forecastday]
}
struct Forecastday: Decodable{
    let day: Day
    let hour: [Hour]
}
struct Hour: Decodable {
    let time: String
}
struct Day: Decodable{
    let maxtemp_c: Double
    let mintemp_c: Double
    let avghumidity: Double
    let condition: Condition
}
struct Condition: Decodable{
    let text: String
}
