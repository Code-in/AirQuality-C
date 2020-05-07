//
//  CountriesListViewController.swift
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {
    
    @IBOutlet weak var countryOutlet: UITableView!
    
    
    var countries: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.countryOutlet.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryOutlet.delegate = self
        countryOutlet.dataSource = self
        
        PJPCityAirQualityController.fetchSupportedCountries() { (countries, error) in
            print(countries)
            self.countries = countries
        }
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Entering Segue")
        if segue.identifier == "toStateVC" {
            guard let indexPath = countryOutlet.indexPathForSelectedRow, let destVC : StatesListViewController = segue.destination as? StatesListViewController else {return}
            let country = countries[indexPath.row]
            print("Segue \(country)")
            destVC.country = country
        }
    }
}
    
    extension CountriesListViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return countries.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
            
            let country = countries[indexPath.row]
            cell.textLabel?.text = country
            
            return cell
        }
        
        
        
}
