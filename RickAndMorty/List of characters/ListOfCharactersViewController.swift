//
//  ListOfCharactersViewController.swift
//  RickAndMorty
//
//  Created by Татьяна on 07.07.2022.
//

import UIKit

class ListOfCharactersViewController: UITableViewController {
    
    private let jsonUrl = "https://rickandmortyapi.com/api/character"
    
    private var rickAndMortyResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return rickAndMortyResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        let character = rickAndMortyResults[indexPath.row]
        cell.congigure(with: character)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = rickAndMortyResults[indexPath.row]
        
        guard let detailInfoVC = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailedInformationViewController else { return }
        detailInfoVC.title = "Character"
        
        detailInfoVC.labelNameOfCharacter = character.name
        detailInfoVC.labelSpeciesOfCharacter = character.species?.rawValue
        detailInfoVC.labelGenderOfCharacter = character.gender?.rawValue
        detailInfoVC.labelStatusOfCharacter = character.status?.rawValue
        detailInfoVC.labelLocationOfCharacter = character.location?.name
        let countOfEpisodes = character.episode?.count
        detailInfoVC.labelCountOfEpisodes = String(describing: countOfEpisodes)
        
        DispatchQueue.global().async {
            guard let image = character.image,
                  let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                detailInfoVC.imageOfCharacter.image = UIImage(data: imageData)
            }
        }
        
        show(detailInfoVC, sender: nil)
        
    }
    
    // MARK: - TableViewDelegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }

            do {
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: data)
                self.rickAndMortyResults = rickAndMorty.results!
              
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
