//
//  ContentView.swift
//  apiWeather
//
//  Created by Macbook on 22.06.2022.
//

import SwiftUI


var cities = ["Kazan", "Moscow", "Innopolis", "London", "Perm", "Anapa", "Sochi", "Ekaterinburg", "Monaco"]

struct ContentView: View {
	
	@State private var name = ""
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack {
					HStack {
						NavigationLink {
							CityView(name: name)
						}
						label: {
							Text("search")
								.font(.title)
								.foregroundColor(.white).padding().background(
									RoundedRectangle(cornerRadius: 20)
										.foregroundColor(.blue))

						}
					
					TextField("enter city", text: $name)
						.font(.title) .padding()
					}
					Divider()
					
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
			}.padding(.horizontal, 10.0).navigationTitle("weather")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
