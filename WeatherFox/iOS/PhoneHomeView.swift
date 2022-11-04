//
//  PhoneHomeView.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import SwiftUI

struct PhoneHomeView: View {

    @StateObject var viewModel = HomeVM(
        service: WeatherServiceImpl()
    )
    
    var body: some View {
        VStack(content: {
            //scroll View with 4 day
            
            
            if let wrapForecast = viewModel.forecast {
                ForEach(wrapForecast.list, id: \.dtTxt) { element in
                    Text("1")
                }
            } else {
                Text("2")
            }
        })
        .task {
           await viewModel.getWeather()
        }
    }
}

struct PhoneHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneHomeView()
    }
}
