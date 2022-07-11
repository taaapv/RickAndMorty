//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Татьяна on 11.07.2022.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var imageOfCharacter: UIImageView!
    @IBOutlet weak var nameOfCharacter: UILabel!
    @IBOutlet weak var speciesOfCharacter: UILabel!
    @IBOutlet weak var genderOfCharacter: UILabel!
    
    func congigure(with character: Result) {
        nameOfCharacter.text = character.name
        speciesOfCharacter.text = character.species?.rawValue
        genderOfCharacter.text = character.gender?.rawValue
        
        DispatchQueue.global().async {
            guard let image = character.image,
                  let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageOfCharacter.image = UIImage(data: imageData)
            }
        }
    }
}
