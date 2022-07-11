//
//  DetailedInformationViewController.swift
//  RickAndMorty
//
//  Created by Татьяна on 11.07.2022.
//

import UIKit

class DetailedInformationViewController: UIViewController {
    
    @IBOutlet weak var imageOfCharacter: UIImageView!
    @IBOutlet weak var speciesOfCharacter: UILabel!
    @IBOutlet weak var nameOfCharacter: UILabel!
    @IBOutlet weak var genderOfCharacter: UILabel!
    @IBOutlet weak var statusOfCharacter: UILabel!
    @IBOutlet weak var locationOfCharacter: UILabel!
    @IBOutlet weak var countOfEpisodes: UILabel!
    
    var labelNameOfCharacter: String?
    var labelSpeciesOfCharacter: String?
    var labelGenderOfCharacter: String?
    var labelStatusOfCharacter: String?
    var labelLocationOfCharacter: String?
    var labelCountOfEpisodes: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let text = labelNameOfCharacter {
                self.nameOfCharacter.text = text
            }
            if let text = labelSpeciesOfCharacter {
                self.speciesOfCharacter.text = text
            }
            if let text = labelGenderOfCharacter {
                self.genderOfCharacter.text = text
            }
            if let text = labelStatusOfCharacter {
                self.statusOfCharacter.text = text
            }
            if let text = labelLocationOfCharacter {
                self.locationOfCharacter.text = text
            }
            if let text = labelCountOfEpisodes {
                self.countOfEpisodes.text = text
            }
        }
}
