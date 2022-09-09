//
//  ViewController.swift
//  AFtest
//
//  Created by qualson1 on 2022/09/09.
//

import UIKit

class ViewController: UIViewController {
    
    var weatherDataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherDataManager.getWeatherData()
    }


}

