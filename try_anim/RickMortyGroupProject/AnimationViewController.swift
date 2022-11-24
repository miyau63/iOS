//
//  AnimationViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 24.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var cucumberImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {self.animate()})
    }
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let sizeX = self.view.frame.size.width * 1.5
            let sizeY = self.view.frame.size.height * 1.5
            let diffX = sizeX - self.view.frame.size.width
            let diffY = self.view.frame.size.height-sizeY
            self.cucumberImage.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: sizeX,
                height: sizeY)
        }, completion: {done in
            if done {
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
                viewController?.modalTransitionStyle = .crossDissolve;
                self.present(viewController!, animated: true)
            }
        })
        
    }
    
//    let viewController = ViewController()
//    present(self.viewController, animated: true)

  

}
