//
//  EpisodesViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 23.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit
import Foundation

class EpisodesViewController: UIViewController {
    
    @IBOutlet weak var episodesView: UIView!
    
    
    let words = ["aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "111", "111", "111", "111"]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = episodesView.bounds
        scrollView.contentSize = contentSize;
        
        return scrollView;
    }()
    
    private lazy var contentSize: CGSize = {
        var contentHeight: CGFloat = CGFloat(ceil(Double(words.count) / 3) * 175);
        return CGSize(width: episodesView.frame.width, height: contentHeight)
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
        
        episodesView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentContainer)
        episodesCards()
    }
}

extension EpisodesViewController {
    
    private func episodesCards () {
        for (index, word) in words.enumerated() {
            let cardWidth: Int = Int((episodesView.frame.size.width - 30) / 3);
            let x = (cardWidth + 15) * (index%3);
            let y = 175 * (index/3);
            let card = UIButton(frame: CGRect(x: x, y: y, width: cardWidth, height: 160))
            card.backgroundColor = .blue
            card.layer.cornerRadius = 10
            card.layer.masksToBounds = true;
            contentContainer.addSubview(card)
        }
    }
}
