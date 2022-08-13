//
//  DetailsVC.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet var capital: UILabel!
    @IBOutlet var region: UILabel!
    @IBOutlet var population: UILabel!
    @IBOutlet var nativeName: UILabel!
    @IBOutlet var independent: UILabel!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var flag: UIImageView!
    var movie: MoviesPage.Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        if movie != nil {
//            countryName.text = country!.name
//            capital.text = country!.capital
//            region.text = country!.region
//            population.text = String(country!.population)
//            nativeName.text = country!.nativeName
//            independent.text = String(country!.independent)
//            flag.load(url: country!.flags.png)
        }
    }
}
