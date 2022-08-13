//
//  DetailsVC.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet var type: UILabel!
    @IBOutlet var rating: UILabel!
    @IBOutlet var votes: UILabel!
    @IBOutlet var lastDate: UILabel!
    @IBOutlet var epCount: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var overView: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    var movie: MoviesPage.Movie? = nil
    var details: DetailsData? = nil
    let networService = NetworkService.shared
    let data: [Double] = [1,2,3,4,5,6,7,8,9,10]
    var postUrlString = ""
    var apiKey = ""
    var guestId: String? = nil
    var urlStringGuest = ""
    var selectedRating: Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        urlStringGuest = "https://api.themoviedb.org/3/authentication/guest_session/new?api_key=\(apiKey)"
        networService.getData(urlString: self.urlStringGuest) { (item: GuestData) in
            self.guestId = item.guest_session_id
            self.postUrlString = "https://api.themoviedb.org/3/tv/\(self.movie!.id)/rating?api_key=\(self.apiKey)&guest_session_id=\(self.guestId!)"
        }
    }
    
    @IBAction func interactedPostButton(_ sender: Any) {
        postRating()
    }
    
    func config() {
        if movie != nil {
            name.text = movie!.name
            overView.text = movie!.overview
            rating.text = String(movie!.vote_average)
            votes.text = String(movie!.vote_count)
            waitForDetails()
            type.text = details!.type
            lastDate.text = details!.last_air_date
            epCount.text = String(details!.last_episode_to_air.episode_number)
            let combinedUrlString: String = "https://image.tmdb.org/t/p/original/" + movie!.poster_path
            image.load(url: URL(string: combinedUrlString)!)
        }
    }
}
