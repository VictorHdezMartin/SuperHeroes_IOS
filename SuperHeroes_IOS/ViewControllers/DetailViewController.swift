//
//  DetailViewController.swift
//  SuperHeroes_IOS
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblDetailName: UILabel!
    @IBOutlet weak var DetailImageView: UIImageView!
    
    var superhero: SuperheroClass!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = superhero.name
        lblDetailName.text = superhero.name
        DetailImageView.loadFrom(url: superhero.image.url)
    }
}
