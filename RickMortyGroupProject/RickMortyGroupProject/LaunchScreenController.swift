//
//  AnimationViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 24.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
    
    let imageView = UIImageView(frame: CGRect(x: 98, y: 292, width: 219, height: 288))
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
        UIView.animate(withDuration: 1, delay:0,  animations:  {
            self.imageView.layer.transform = CATransform3DMakeRotation(-3.14, 0, 1, 0)
        }, completion: {done in
            if done {
                UIView.animate(withDuration: 1, delay:0,  animations:  {
                    self.imageView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0)
                }, completion: {done in
                    if done {
                        UIView.animate(withDuration: 1, delay:0,  animations:  {
                            self.imageView.layer.transform = CATransform3DMakeRotation(-3.14, 0, 1, 0)
                        }, completion: {done in
                            if done {
                                UIView.animate(withDuration: 1, delay:0,  animations:  {
                                    self.imageView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0)
                                }, completion: {done in
                                    if done {
                                        let sb = UIStoryboard(name: "Main", bundle:nil)
                                        let vc = sb.instantiateInitialViewController()
                                        UIApplication.shared.keyWindow?.rootViewController = vc
                                    }
                                })
                            }
                        })
                    }
                })
            }
        })
    }
}
