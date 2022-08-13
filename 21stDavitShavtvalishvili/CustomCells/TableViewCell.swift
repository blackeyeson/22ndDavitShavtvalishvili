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
    var movie: MoviesPage.Movie? = nil
    var apiKey: String = ""
    
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config() {
        name.text = movie!.name
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.movie = self.movie
        vc.getDetails(id: self.movie!.id)
        vc.apiKey = self.apiKey
        delegate!.navigationController?.pushViewController(vc,
                                                           animated: true)
    }
}
