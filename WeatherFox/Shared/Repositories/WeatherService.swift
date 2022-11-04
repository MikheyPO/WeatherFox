//
//  WeatherService.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 04.11.2022.
//

import SwiftUI

protocol WeatherService {
    func fetchFourDays() async throws -> ForecastModel
}

final class WeatherServiceImpl: WeatherService {
    
    func fetchFourDays() async throws -> ForecastModel {
        let urlSession = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=c3b257e82b410a26fab0c7ea21636967")!
        let (data,_) = try await urlSession.data(from: url)
        return try JSONDecoder().decode(ForecastModel.self, from: data)
    }
    
}
