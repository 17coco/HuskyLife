//
//  CountryPickerViewController.swift
//  HuskyLife
//
//  Created by Beihan  Zhou  on 12/2/24.
//

import UIKit

class CountryPickerViewController: UITableViewController {
    var countries = Locale.isoRegionCodes.compactMap {
        Locale.current.localizedString(forRegionCode: $0)
    }.sorted()
    
    var onSelectCountry: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Country/Region"
    }
}

extension CountryPickerViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        onSelectCountry?(selectedCountry)
        dismiss(animated: true, completion: nil)
    }
}


