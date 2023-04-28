//
//  WeatherData.swift
//  MasterWeather
//
//  Created by user235115 on 4/20/23.
//

import Foundation
struct WeatherData: Decodable{
    let forecast: Forecast
}
struct Forecast: Decodable {
    let forecastday : [ForecastDay]
}
struct ForecastDay : Decodable{
    let day : Day
    let hour : [Hour]
}
struct Day: Decodable {
    let mintemp_c : Double
    let maxtemp_c : Double
    let avghumidity : Double
    let condition : Condition
}
struct Hour : Decodable{
    let time : String
}
struct Condition: Decodable {
    let text : String
    let icon : String
}
