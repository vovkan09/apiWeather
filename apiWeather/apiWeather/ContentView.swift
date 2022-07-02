//
//  ContentView.swift
//  apiWeather
//
//  Created by Macbook on 22.06.2022.
//

import SwiftUI

var cities = ["Kazan", "Moscow", "Innopolis", "London", "Perm", "Anapa", "Sochi", "Ekaterinburg", "Monaco"]

struct ContentView: View {
    
	var body: some View {
		NavigationView {
			ScrollView {
				VStack {
					ForEach(cities, id: \.self) { city in
						NavigationLink {
							CityView(name: city)
						}
					
					label: {
						Text(city)
						}.font(.largeTitle)
							.foregroundColor(.white)
							.frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, alignment: .top)
							.frame(height: 80)
							.background(
								RoundedRectangle(cornerRadius: 20)
									.foregroundColor(.blue))
							
						
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
