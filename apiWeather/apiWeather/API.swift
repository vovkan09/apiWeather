//
//  API.swift
//  apiWeather
//
//  Created by Macbook on 26.06.2022.
//

import Foundation

class Api {
    func getPost(nameCity: String, completion: @escaping(WeatherInfo) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(nameCity)&APPID=0ee73ee655b84ed02473641c7f2f44d4")
        else{ return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in

            let weather = try! JSONDecoder().decode(WeatherInfo.self, from: data!)
            DispatchQueue.main.async {
                completion(weather)
            }
        }
        .resume()
    }
}

struct WeatherInfo: Codable {
    var weather: [Weather] = [Weather()]
    var main: Main = Main()
    var name: String = ""
}

struct Main: Codable {
    var temp: Double = 1
}

struct Weather: Codable {
    var main = ""
}
