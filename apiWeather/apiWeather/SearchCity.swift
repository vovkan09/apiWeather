//
//  SearchCity.swift
//  apiWeather
//
//  Created by Macbook on 13.07.2022.
//

import SwiftUI

struct SearchCity: View {
    
    @State private var name = "kazan"
    
    var body: some View {
        VStack {
            NavigationLink {
                CityView(nameCity: name)
            }
            label: {
                HStack {
                    Text("search city:")
                    TextField("insert city", text: $name)
                }.font(.title) .padding()
            }
        }
    }
}
struct SearchCity_Previews: PreviewProvider {
    static var previews: some View {
        SearchCity()
    }
}
