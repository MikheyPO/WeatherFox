//
//  WeatherFoxApp.swift
//  WeatherFox
//
//  Created by Vladislav Mikheenko on 01.11.2022.
//

import SwiftUI

@main
struct WeatherFoxApp: App {
    var body: some Scene {
        WindowGroup {
            //check device
            PhoneHomeView()
        }
    }
}
