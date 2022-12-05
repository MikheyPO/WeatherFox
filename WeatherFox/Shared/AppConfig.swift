//
//  AppConfig.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 28.11.2022.
//

import SwiftUI

/// Generic configurations for the app
class AppConfig {
    
}

extension Color {
    
   static func custom(type: ColorType) -> Color {
        return Color(type.rawValue)
    }
    
    enum ColorType: String {
        case bg = "bg"
        case mainText = "mainText"
        case subText = "subText"
    }
}
