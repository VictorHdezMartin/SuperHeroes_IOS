//
//  ViewController.swift
//  SuperHeroes_IOS
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
        
    @IBOutlet weak var tableView: UITableView!
        
    var list: [SuperheroClass] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
            
     // vemos la barra de búsqueda-------------------------------------------------------
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
            
        findSuperheroBy(name: "a")
    }
        
// funciones del TableView  ----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SuperheroViewCell
        let superhero = list[indexPath.item]
        cell.render(superhero: superhero)
        return cell
    }
    
// Barra de búsqueda: OnChange  ------------------------------------------------------------------------
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            findSuperheroBy(name: query)
        } else {
            findSuperheroBy(name: "a")
        }
    }
        
// movernos a otro ViewController pasando parámetros --------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDetail") {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let superhero = list[indexPath.row]
            detailViewController.superhero = superhero
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
// Búsqueda de superheroe por nombre ---------------------------------------------------------------
        
    func findSuperheroBy(name: String) {
        Task {
            do {
                list = try await SuperheroProvider.findSuperheroesBy(name: name)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}
