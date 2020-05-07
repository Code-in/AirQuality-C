//
//  CitiesListViewController.swift
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {

    @IBOutlet weak var citiesTableviewOutlet: UITableView!
    
    
    var country: String?
    var state: String?
    var cities: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.citiesTableviewOutlet.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citiesTableviewOutlet.delegate = self
        self.citiesTableviewOutlet.dataSource = self
        print("Cities viewDidLoad state: \(state)")
        print("Cities viewDidLoad country: \(country)")
        guard let state = state else  { return }
        guard let country = country else  { return }
        print("Cities viewDidLoad")
        PJPCityAirQualityController.fetchSupportedCities(inState: country, state: state) { (cities, error) in
            print(country)
            print(state)
            self.cities = cities
        }
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Entering Segue")
        if segue.identifier == "toCityVC" {
            guard let indexPath = citiesTableviewOutlet.indexPathForSelectedRow, let destVC : CityDetailsViewController = segue.destination as? CityDetailsViewController else {return}
            let city = cities[indexPath.row]
            print("Segue City Details \(city)")
            destVC.city = city
            guard let state = state else { return }
            destVC.state = state
            guard let country = country else { return }
            destVC.country = country
        }
    }

}

extension CitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Cities numberOfRowsInSection")
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath)
        print("Cities cellForRowAt")
        let city = cities[indexPath.row]
        cell.textLabel?.text = city
        
        return cell
    }
  
    

}
