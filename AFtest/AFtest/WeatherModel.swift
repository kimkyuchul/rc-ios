//
//  WeatherModel.swift
//  AFtest
//
//  Created by qualson1 on 2022/09/09.
//

import Foundation


import Foundation

struct WeatherDataModel: Codable {
    let name: String
    let main: WeatherData

}

struct WeatherData: Codable {
    let temp: Double
}
