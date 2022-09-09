//
//  WeatherDataManager.swift
//  AFtest
//
//  Created by qualson1 on 2022/09/09.
//

import Foundation
import Alamofire


class WeatherDataManager {
    func getWeatherData() {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=",
                   method: .get,
                   headers: nil)
        .validate()
        .responseDecodable(of: WeatherDataModel.self) { response in
            switch response.result {
            case .success(let response):
                let temp = response.main.temp
                let name = response.name
                print(temp)
                print(name)
                
            case .failure:
                print(response)
            }
        }
    }
}
