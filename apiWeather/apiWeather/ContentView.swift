//
//  ContentView.swift
//  apiWeather
//
//  Created by Macbook on 22.06.2022.
//

import SwiftUI


struct ContentView: View {
    
    var nameCity = ["Kazan", "Moscow", "London", "Perm", "Anapa", "Sochi", "Ekaterinburg"]
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink {
                    OneCity()
                }
                
                label: {
                    Text(nameCity[0])
                } .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, alignment: .top)
                    .frame(height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue))
                
                NavigationLink {
                    OneCity2()
                }
            
                label: {
                   Text(nameCity[1])
                } .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, alignment: .top)
                    .frame(height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue))
				
				NavigationLink {
					OneCity3()
				}
				
				label: {
					Text(nameCity[2])
				} .font(.largeTitle)
					.foregroundColor(.white)
					.frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, alignment: .top)
					.frame(height: 80)
					.background(
						RoundedRectangle(cornerRadius: 20)
							.foregroundColor(.blue))
				
                NavigationLink {
                    OneCity4()
                }
                label: {
                   Text(nameCity[3])
                } .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, alignment: .top)
                    .frame(height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue))
				
				NavigationLink {
					OneCity5()
				}
				
				label: {
					Text(nameCity[4])
				} .font(.largeTitle)
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

struct OneCity: View {
    
    @State var info = WeatherInfo()
    
    var body: some View {
                VStack {
                    Text("\(Int(info.main.temp - 273)) C")
                    Spacer()
                    Text("Conditions: \(info.weather[0].main)")
                    
				} .frame(height: 200)
            .onAppear() {
				Api() .getPost(nameCity: "kazan") { (info) in
                    self.info = info
                }
            } .navigationBarTitle(info.name)
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

struct OneCity2: View {
	
	@State var info = WeatherInfo()
	
	var body: some View {
				VStack {
					Text("\(Int(info.main.temp - 273)) C")
					Spacer()
					Text("Conditions: \(info.weather[0].main)")
					
				} .frame(height: 200)
			.onAppear() {
				Api() .getPost(nameCity: "moscow") { (info) in
					self.info = info
				}
			} .navigationBarTitle(info.name)
		}
		
}

struct OneCity3: View {
	
	@State var info = WeatherInfo()
	
	var body: some View {
				VStack {
					Text("\(Int(info.main.temp - 273)) C")
					Spacer()
					Text("Conditions: \(info.weather[0].main)")
					
				} .frame(height: 200)
			.onAppear() {
				Api() .getPost(nameCity: "london") { (info) in
					self.info = info
				}
			} .navigationBarTitle(info.name)
		}
		
}
	
struct OneCity4: View {
	
	@State var info = WeatherInfo()
	
	var body: some View {
				VStack {
					Text("\(Int(info.main.temp - 273)) C")
					Spacer()
					Text("Conditions: \(info.weather[0].main)")
					
				} .frame(height: 200)
			.onAppear() {
				Api() .getPost(nameCity: "perm") { (info) in
					self.info = info
				}
			} .navigationBarTitle(info.name)
		}
		
}

struct OneCity5: View {
	
	@State var info = WeatherInfo()
	
	var body: some View {
				VStack {
					Text("\(Int(info.main.temp - 273)) C")
					Spacer()
					Text("Conditions: \(info.weather[0].main)")
					
				} .frame(height: 200)
			.onAppear() {
				Api() .getPost(nameCity: "anapa") { (info) in
					self.info = info
				}
			} .navigationBarTitle(info.name)
		}
		
}




struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
