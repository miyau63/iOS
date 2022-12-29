//
//  ViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 16.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CharactersButton: UIButton!
    @IBOutlet weak var LocationsButton: UIButton!
    @IBOutlet weak var EpisodesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        CharactersButton.layer.cornerRadius = 15
        CharactersButton.layer.masksToBounds = true;
        
        LocationsButton.layer.cornerRadius = 15
        LocationsButton.layer.masksToBounds = true;
        
        EpisodesButton.layer.cornerRadius = 15
        EpisodesButton.layer.masksToBounds = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
}

