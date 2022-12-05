//
//  CurrentWeatherView.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    var city: String
    var weather: WeatherModel
    
//    TodayWeatherView
    init(city: String, weather: WeatherModel) {
        self.city = city
        self.weather = weather
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
                HStack {
                    Text(city)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
            HStack(alignment: .center, spacing: 5) {
                    temperatureView
                    
                    VStack(alignment: .leading, spacing: 0) {
                        degreesView
                        feelsLikeView
                    }
                }
            }
            .padding(.vertical, 10)
            .background(Color.custom(type: .bg))
            .cornerRadius(20)
            .padding(.horizontal, 20)
        }
    
    private var temperatureView: some View {
        Text("\(Int(weather.main.temp))")
            .font(.system(size: 120))
            .fontWeight(.medium)
            .foregroundColor(.white)
    }
    
    private var degreesView: some View {
        Text("°C")
            .font(.system(size: 40))
            .fontWeight(.medium)
            .foregroundColor(.white)
    }
    
    private var feelsLikeView: some View {
        VStack(alignment: .leading) {
            Text("feels like")
            Text("\(Int(weather.main.feelsLike))°")
        }
        .font(.subheadline)
        .foregroundColor(.custom(type: .subText))
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(city: "Zurich", weather: WeatherModel.makeFake())
    }
}
