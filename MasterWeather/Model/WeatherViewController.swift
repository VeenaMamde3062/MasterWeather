//
//  WeatherViewController.swift
//  MasterWeather
//
//  Created by user235115 on 4/20/23.
//

import UIKit

class WeatherViewController: UIViewController{
    var weatherArray = [ForecastDay]()
    var q : String = ""
    var dt : String = ""
    var end_dt : String = ""
    var lang : String = ""
    var hour : String = ""
    var language : String = "en"
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(q,dt,end_dt,lang,hour)
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func getData(_ q: String,_ dt:String,_ end_dt:String,_ lang:String,_ hour: String){
        if lang == "english"{
            language = "en"
        }else if lang == "hindi"{
            language = "hi"
        }
        let weatherurl = "https://api.weatherapi.com/v1/history.json"
        let key = "bb29dfa5fe1b4049b7093333231704"
        let urlString = ("\(weatherurl)?q=\(q)&dt=\(dt)&end_dt=\(end_dt)&lang=\(language)&hour=\(hour)&key=\(key)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let anonymousFunction = {(gotData: [ForecastDay]) in
            DispatchQueue.main.async {
                self.weatherArray = gotData
                self.myTableView.reloadData()
            }
        }
        performRequest(urlString!,onCompletion: anonymousFunction)
    }
    func performRequest(_ urlstring : String,onCompletion: @escaping ([ForecastDay]) -> ()){
        let url = URL(string: urlstring)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                if error == nil{
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                    self.weatherArray = weatherData.forecast.forecastday
                    onCompletion(self.weatherArray)
                }
            }catch{
                print("Error in getting json data")
            }
        }.resume()
    }
}
extension WeatherViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        let forecastday = weatherArray[indexPath.row]
        let maxTemp = String(forecastday.day.maxtemp_c)
        let minTemp = String(forecastday.day.mintemp_c)
        let humidity = String(forecastday.day.avghumidity)
        let condition = String(forecastday.day.condition.text)
        let time = String(forecastday.hour[0].time)
        cell.maxtemp.text = "MaxTemp: \(maxTemp)"
        cell.mintemp.text = "MinTemp: \(minTemp)"
        cell.humidity.text = "Humidity: \(humidity)%"
        cell.condition.text = "Condition: \(condition)"
        cell.time.text = "Time: \(time)"
        return cell
    }
}

