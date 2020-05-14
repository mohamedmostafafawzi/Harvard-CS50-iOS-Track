//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Mohamed Mostafa Fawzi on 2/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var type1Label: UILabel!
    @IBOutlet var type2Label: UILabel!

    var pokemon: Pokemon!
    
    // capitalisation function
    func capitalize (text: String) -> String {
        text.prefix(1).uppercased() + text.dropFirst()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type1Label.text = ""
        type2Label.text = ""
        
        // Getting the data for the Pokemon, name, number and type
        let url = URL(string: pokemon.url)
        guard let u = url else {
            return
        }
        // Using URLSession to get the data from the API
        URLSession.shared.dataTask(with: u) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
            // Decoding the data from JSON object
            let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                
                DispatchQueue.main.async {
                    self.nameLabel.text = self.capitalize(text: self.pokemon.name)
                    self.numberLabel.text = String(format: "#%03d", pokemonData.id)
                    
                    for typeEntry in pokemonData.types {
                        if typeEntry.slot == 1 {
                            self.type1Label.text = self.capitalize(text: typeEntry.type.name)
                        }
                        else if typeEntry.slot == 2 {
                            self.type2Label.text = self.capitalize(text: typeEntry.type.name)
                        }
                    }
                }
        }
            catch let error {
                print("\(error)")
            }
        }.resume()
        
    }
}
