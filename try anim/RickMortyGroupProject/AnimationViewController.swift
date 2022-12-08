//
//  AnimationViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 24.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    let imageView = UIImageView(frame: CGRect(x: 98, y: 292, width: 219, height: 288))    //@IBOutlet weak var cucumberImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
    }

    private func animate(){
        imageView.image = UIImage(named: "cucumber")
        imageView.contentMode = .scaleAspectFill
        let transformLayer = CATransformLayer()
        
        transformLayer.addSublayer(imageView.layer)
        view.layer.addSublayer(transformLayer)
        
        imageView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0)
        
        UIView.animate(withDuration: 2, delay:0, options: .autoreverse,  animations:  {

            self.imageView.layer.transform = CATransform3DMakeRotation(-3.14, 0, 1, 0)
//            self.imageView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0)
//            self.imageView.layer.transform = CATransform3DMakeRotation(3.14, 0, 1, 0)
            

        }, completion: {done in
            if done {
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
                viewController?.modalTransitionStyle = .crossDissolve;
                self.navigationController?.pushViewController(viewController!, animated: true )
            }
        })
        
    }

  

}
