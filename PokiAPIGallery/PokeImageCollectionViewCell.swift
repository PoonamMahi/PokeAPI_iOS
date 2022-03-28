//
//  PokeImageCollectionViewCell.swift
//  PokiAPIGallery
//
//  Created by Poonam Mahi on 2022-03-28.
//

import UIKit

class PokeImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var deleteImageButton: UIButton!
    @IBOutlet weak var pokeimage: UIImageView!
    
    override func awakeFromNib() {
        
        pokeImageSetup()
        
    }
    
    /** Setting Up pokeImage UI */
    func pokeImageSetup() {
        
        pokeimage.layer.cornerRadius = pokeimage.frame.height/2
        pokeimage.clipsToBounds = true
    }
}
