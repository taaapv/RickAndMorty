//
//  DetailedInformationViewController.swift
//  RickAndMorty
//
//  Created by Татьяна on 11.07.2022.
//

import UIKit

class DetailedInformationViewController: UIViewController {
    
    @IBOutlet weak var imageOfCharacterImageView: UIImageView!
    @IBOutlet weak var speciesOfCharacterLabel: UILabel!
    @IBOutlet weak var nameOfCharacterLabel: UILabel!
    @IBOutlet weak var genderOfCharacterLabel: UILabel!
    @IBOutlet weak var statusOfCharacterLabel: UILabel!
    @IBOutlet weak var locationOfCharacterLabel: UILabel!
    @IBOutlet weak var countOfEpisodesLabel: UILabel!
    
    var imageOfCharacterUrl: String?
    var nameOfCharacter: String?
    var speciesOfCharacter: String?
    var genderOfCharacter: String?
    var statusOfCharacter: String?
    var locationOfCharacter: String?
    var countOfEpisodes: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let text = nameOfCharacter {
                self.nameOfCharacterLabel.text = text
            }
            if let text = speciesOfCharacter {
                self.speciesOfCharacterLabel.text = text
            }
            if let text = genderOfCharacter {
                self.genderOfCharacterLabel.text = text
            }
            if let text = statusOfCharacter {
                self.statusOfCharacterLabel.text = text
            }
            if let text = locationOfCharacter {
                self.locationOfCharacterLabel.text = text
            }
            if let text = countOfEpisodes {
                self.countOfEpisodesLabel.text = text
            }
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: self.imageOfCharacterUrl!) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                DispatchQueue.main.async {
                    self.imageOfCharacterImageView.image = UIImage(data: imageData)
                }
            }
        }
}
