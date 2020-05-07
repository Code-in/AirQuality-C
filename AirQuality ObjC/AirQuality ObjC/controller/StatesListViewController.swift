//
//  StatesListViewController.swift
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class StatesListViewController: UIViewController {
    
    @IBOutlet weak var stateOutlet: UITableView!
    
    var country: String?
    var states: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.stateOutlet.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateOutlet.delegate = self
        stateOutlet.dataSource = self
        guard let country = country else  { return }
        print("State viewDidLoad")
        PJPCityAirQualityController.fetchSupportedStates(inCountry: country) { (states, error) in
            print(states)
            self.states = states
        }
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Entering Segue")
        if segue.identifier == "toCitiesVC" {
            guard let indexPath = stateOutlet.indexPathForSelectedRow, let destVC : CitiesListViewController = segue.destination as? CitiesListViewController else {return}
            let state = states[indexPath.row]
            print("Segue \(state)")
            destVC.state = state
            guard let country = country else { return }
            destVC.country = country
        }
    }


}

extension StatesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = states[indexPath.row]
        cell.textLabel?.text = state
        
        return cell
    }
  
    

}
