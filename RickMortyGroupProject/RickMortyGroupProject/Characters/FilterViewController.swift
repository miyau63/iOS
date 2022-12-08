//
//  FilterViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 16.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    
    
    @IBOutlet weak var btnAlive: UIButton!
    @IBOutlet weak var btnDead: UIButton!
    @IBOutlet weak var btnStatusUnknown: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnGenderless: UIButton!
    @IBOutlet weak var btnGenderUnknown: UIButton!
    
    let radioController: RadioButtonController = RadioButtonController()
    let radioController2: RadioButtonController = RadioButtonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioController.buttonsArray = [btnAlive,btnDead,btnStatusUnknown]
        radioController2.buttonsArray = [btnFemale,btnMale,btnGenderless,btnGenderUnknown]
    }
    
    //Status
    @IBAction func btnAliveAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }    
    
    @IBAction func btnDeadAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    @IBAction func btnStatusUnknownAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    
    //Gender
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    @IBAction func btnMaleAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    @IBAction func btnGenderlessAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    @IBAction func btnGenderUnknownAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    
    
    //Reset
    @IBAction func ResetStatus(_ sender: Any) {
        radioController.reset()
    }
    
    @IBAction func ResetGender(_ sender: UIButton) {
        radioController2.reset()
    }
    
    
}
