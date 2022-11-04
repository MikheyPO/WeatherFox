//
//  HomeVM.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import Foundation

@MainActor
final class HomeVM: ObservableObject {
    
    @Published private(set) var forecast: ForecastModel? = nil
    
    private let service: WeatherService
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func getWeather() async {
        do {
            self.forecast = try await service.fetchFourDays()
        } catch {
            print("error fetch")
        }
    }
    
}
