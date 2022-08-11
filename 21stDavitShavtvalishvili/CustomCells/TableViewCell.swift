//
//  TableViewCell.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var index: Int? = nil
    var delegate: TableVC? = nil
    var country: Country? = nil
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config() {
        name.text = country!.name
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.country = self.country
        delegate!.navigationController?.pushViewController(vc,
                                                          animated: true)
    }
}
