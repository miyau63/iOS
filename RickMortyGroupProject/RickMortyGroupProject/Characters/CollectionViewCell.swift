//
//  CollectionViewCell.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 01.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {   
 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    var container: Container? {
        didSet{
            labelView.text = container?.name
            if let image = container?.imageName{
                imageView.image = UIImage(data: image)
            }      
        }
    }
    
}
