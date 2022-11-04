//
//  WeatherRepository.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import SwiftUI

final class WeatherRepository {
    
     func currentWeather() async -> ForecastModel? {
        guard let testUrl = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=c3b257e82b410a26fab0c7ea21636967") else { return nil }
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: testUrl)
            
            let decoder = JSONDecoder()
            let forecast = try decoder.decode(ForecastModel.self, from: data)
            return forecast
            print("current \(forecast)")
            
        } catch let error {
            print("erros req \(error.localizedDescription)")
            return nil
        }
        
//      // build the request
//      let request = buildURLRequest(for: searchTerm)
//
//      do {
//        let (data, response) = try await URLSession.shared.data(for: request)
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//          throw WordsAPI.invalidServerResponse
//        }
//        let word = try JSONDecoder().decode(Word.self, from: data)
//        return word
//      }
//      catch {
//        return Word.empty
//      }
    }
}
