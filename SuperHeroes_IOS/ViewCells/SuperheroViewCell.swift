//
//  SuperheroViewCell.swift
//  SuperHeroes_IOS
//
//  Created by Tardes on 18/12/24.
//

import UIKit

class SuperheroViewCell: UITableViewCell {

    @IBOutlet weak var lblMainName: UILabel!
    @IBOutlet weak var MainImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render(superhero: SuperheroClass) {
        lblMainName.text = superhero.name
        MainImageView.loadFrom(url: superhero.image.url)
    }
}
