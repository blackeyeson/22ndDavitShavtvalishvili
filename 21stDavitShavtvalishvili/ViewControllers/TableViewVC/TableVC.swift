//
//  TableVC.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import UIKit

class TableVC: UIViewController {
    
    var countries: [Country]? = nil
    var countriesFiltered: [Country] = []
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiguration()
        loadTableData()
        searchBar.delegate = self
    }
    
}
