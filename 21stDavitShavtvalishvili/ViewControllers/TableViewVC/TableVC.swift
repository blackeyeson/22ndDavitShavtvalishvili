//
//  TableVC.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import UIKit

class TableVC: UIViewController {
    
    var moviesPage: MoviesPage? = nil
    var moviesPageFiltered: MoviesPage? = nil
    let apiKey = "4d5c910865a5edc352e68d5a59651d23"
    var urlString1 = ""
    var networService = NetworkService.shared
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlString1 = "https://api.themoviedb.org/3/tv/top_rated?api_key=\(apiKey)&language=en-US&page=1/"
        tableConfiguration()
        loadTableData()
        searchBar.delegate = self
    }
    
}
