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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { countriesFiltered.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let i = indexPath[1]
        
        cell.index = i
        cell.delegate = self
        
        if countries != nil {
            cell.country = countriesFiltered[i]
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
        DispatchQueue.global(qos: .utility).async {
            self.getCountries()
            self.waitingg()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func waitingg() {
        if countries == nil { sleep(1); waitingg() }
    }
}
