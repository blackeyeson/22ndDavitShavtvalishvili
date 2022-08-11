//
//  SearchBar.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import Foundation
import UIKit

extension TableVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" && countries != nil {
            countriesFiltered = countries!
            countriesFiltered = countries!.filter { $0.name.contains(searchBar.text!) }
            tableView.reloadData()
        } else {
            countriesFiltered = countries!
            tableView.reloadData()
        }
    }
}
