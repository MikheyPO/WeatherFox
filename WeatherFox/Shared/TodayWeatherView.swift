//
//  TodayWeatherView.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import SwiftUI

struct TodayWeatherView: View {
    
    var city: String
    var weather: WeatherModel
    
//    TodayWeatherView
    init(city: String, weather: WeatherModel) {
        self.city = city
        self.weather = weather
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(city)
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("\(Int(weather.main.temp))")
                    .font(.system(size: 80))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 50)
            }
            .padding(.vertical, 40)
            .fixedSize()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .padding(.horizontal, 20)
            
            Image(systemName: "envelope")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(city: "London", weather: WeatherModel.makeFake())
    }
}
