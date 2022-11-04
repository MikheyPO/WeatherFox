//
//  ForecastModel.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import Foundation

struct ForecastModel: Codable {
    let list: [WeatherModel]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct WeatherModel: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sys
    let snow: Rain?
    let dtTxt: String
    

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys, snow
        case dtTxt = "dt_txt"
    }
    
    static func makeFake() -> WeatherModel {
        let main = MainClass(temp: 26, feelsLike: 21, tempMin: 10, tempMax: 30, pressure: 1000, seaLevel: 100, grndLevel: 30, humidity: 10, tempKf: 20.3)
        let weather = Weather(id: 1, main: "Cloud", weatherDescription: "Very", icon: "icon1")
        return WeatherModel(dt: 1667347200, main: main, weather: [weather], clouds: .init(all: 90), wind: .init(speed: 1.13, deg: 218, gust: 1.11), visibility: 10000, pop: 1, rain: Rain(the3H: 0.14), sys: Sys(pod: .d), snow: Rain(the3H: 0.14), dtTxt: "2022-11-02 06:00:00")
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    //fix to enum
    let main: String
        //fix to enum
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case lightSnow = "light snow"
    case overcastClouds = "overcast clouds"
    case snow = "snow"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
