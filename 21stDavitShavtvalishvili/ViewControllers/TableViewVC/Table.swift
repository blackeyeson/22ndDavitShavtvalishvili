//
//  Table.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import Foundation
import UIKit

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { moviesPageFiltered?.results.count ?? 0 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let i = indexPath[1]
        
        cell.index = i
        cell.delegate = self
        cell.apiKey = self.apiKey
        
        if moviesPage != nil {
            cell.movie = moviesPageFiltered!.results[i]
            cell.config()
        }
        
        return cell
    }

    func tableConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.reloadData()
    }
    
    func loadTableData() {
        networService.getData(urlString: self.urlString1) { (item: MoviesPage) in
            self.moviesPage = item
            self.moviesPageFiltered = item
            self.waitingg()
            self.tableView.reloadData()
        }
    }
        
    func waitingg() {
        if moviesPage == nil { sleep(1); waitingg() }
    }
}
