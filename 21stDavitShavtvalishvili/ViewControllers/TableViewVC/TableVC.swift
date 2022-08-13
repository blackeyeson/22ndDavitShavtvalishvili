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
    let urlString1 = "https://api.themoviedb.org/3/tv/top_rated?api_key=4d5c910865a5edc352e68d5a59651d23&language=en-US&page=1/"
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiguration()
        loadTableData()
        searchBar.delegate = self
    }
    
}
