//
//  CityDetailsViewController.swift
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class CityDetailsViewController: UIViewController {
    
    @IBOutlet weak var fishboneLabel: UILabel!
    @IBOutlet weak var tempLabelOutlet: UILabel!
    @IBOutlet weak var humidityLabelOutlet: UILabel!
    @IBOutlet weak var windSpeedLabelOutlet: UILabel!
    @IBOutlet weak var airQualityLabelOutlet: UILabel!
    var country: String?
    var state: String?
    var city: String?
    var details: PJPCityAirQuality? {
        didSet {
            DispatchQueue.main.async {
                guard let state = self.state else { return }
                guard let city = self.city else { return }
                guard let country = self.country else { return }
                self.fishboneLabel.text = "\(country) > \(state) > \(city)"
                guard let tempature = self.details?.weather.tempature else { return }
                self.tempLabelOutlet.text = "Tempature: \(tempature)"
                guard let humidity = self.details?.weather.humidity else { return }
                self.humidityLabelOutlet.text = "Humidity: \(humidity)"
                guard let windSpeed = self.details?.weather.windSpeed else { return }
                self.windSpeedLabelOutlet.text = "Wind Speed:\(windSpeed)"
                guard let airQuality = self.details?.pollution.airQualityIndex else { return }
                self.airQualityLabelOutlet.text = "Air Quality Index: \(airQuality)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else { return }
        guard let city = city else { return }
        guard let country = country else { return }
        
        PJPCityAirQualityController.fetchData(forCity: country, state: state, city: city) { (details) in
            print(details)
            self.details = details
        }
    }
    

}
