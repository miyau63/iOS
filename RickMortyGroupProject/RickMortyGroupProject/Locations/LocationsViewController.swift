//
//  LocationsViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 23.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {
    
    @IBOutlet weak var locationsView: UIView!
    
    let words = ["aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "111", "111", "111", "111", "bbb", "ccc"]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = locationsView.bounds
        scrollView.contentSize = contentSize;
    
        return scrollView;
    }()
    
    private lazy var contentSize: CGSize = {
        var contentHeight: CGFloat = CGFloat(ceil(Double(words.count) / 3) * 175);
    
        return CGSize(width: locationsView.frame.width, height: contentHeight)
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView;
    }()
    
    private var contentContainer: UIView = {
        let contentContainer = UIView()
        return contentContainer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationsView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentContainer)
        locationsCards()
    }
}

extension LocationsViewController {

    private func locationsCards () {
        for (index, word) in words.enumerated() {
            let cardWidth: Int = Int((locationsView.frame.size.width - 30) / 3);
            let x = (cardWidth + 15) * (index%3);
            let y = 175 * (index/3);
            let card = UIButton(frame: CGRect(x: x, y: y, width: cardWidth, height: 160))
            card.backgroundColor = .white
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true;
            contentContainer.addSubview(card)
        }
    }
}

