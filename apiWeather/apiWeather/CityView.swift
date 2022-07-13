//
//  CityView.swift
//  apiWeather
//
//  Created by Macbook on 27.06.2022.
//

import SwiftUI

struct CityView: View {
    
    var nameCity: String
    @State var info = WeatherInfo()
    
    init (name: String) {
        nameCity = name
    }
    
    var body: some View {
        VStack {

            Text("\(Int(info.main.temp - 273)) C")
            Spacer()
            Text("Conditions: \(info.weather[0].main)")
            
            let condition: String = info.weather[0].main
            
            switch condition {
            case "Clouds":
                Image("imgClouds")
            case "Clear":
                Image("imgClear")
            case "Rain":
                Image("imgRain")
                
            default:
                Text("dont know condition")
            }
            
        } .frame(height: 200)
            .onAppear() {
                Api() .getPost(nameCity: nameCity) { (info) in
                    self.info = info
                }
            }.navigationBarTitle(info.name)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(name: "kddazan")
    }
}
