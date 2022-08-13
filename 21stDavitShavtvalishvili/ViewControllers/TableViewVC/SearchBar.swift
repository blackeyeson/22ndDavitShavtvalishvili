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
        if searchBar.text != "" && moviesPage != nil {
            moviesPageFiltered = moviesPage!
            moviesPageFiltered!.results = moviesPage!.results.filter { $0.name.contains(searchBar.text!) }
            tableView.reloadData()
        } else {
            moviesPageFiltered!.results = moviesPage?.results ?? []
            tableView.reloadData()
        }
    }
}
