//
//  ViewController.swift
//  Pokedex
//
//  Created by Mohamed Mostafa Fawzi on 2/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pokemon: [Pokemon] = []
    
    // capitalisation function
    func capitalize (text: String) -> String {
        text.prefix(1).uppercased() + text.dropFirst()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Getting the list of Pokemon data from the PokeAPI
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=964")
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
            let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
                self.pokemon = pokemonList.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
            catch let error {
                print("\(error)")
            }
        }.resume()
    }
    // Table section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Table row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    // Table cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        cell.textLabel?.text = capitalize(text: pokemon[indexPath.row].name)
        return cell
    }
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonSegue"{
            if let destination = segue.destination as? PokemonViewController{
                destination.pokemon = pokemon[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

