//
//  CharactersViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 23.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    
    var charactersCards:[ResultsItem] = [] ;
    var count = 0;
    var tempCount = 24;
    @IBOutlet weak var charactersView: UIView!
    
    func getResponse() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return}
        
        let session = URLSession.shared.dataTask(with: url){(data, response, error) in
            if let response =  response {
                print(response)
            }
            guard let data = data else {return};
            do{
                let characters:Character = try JSONDecoder().decode(Character.self, from: data)
                for i in characters.results{
                    self.charactersCards.append(i)
                }
                self.count = characters.info.count;
                //                print(self.count)
                //                print(self.charactersCards)
                //                self.showCards()
            }catch{
                print(error)
            }
            
            }.resume()
    }
    
    let words = ["aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "aaa", "bbb", "ccc", "111", "111", "111", "111", "bbb"]
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = charactersView.bounds
        scrollView.contentSize = contentSize;
        
        return scrollView;
    }()
    
    private lazy var contentSize: CGSize = {        
        var contentHeight: CGFloat = CGFloat(ceil(Double(words.count) / 3) * 175);
        return CGSize(width: charactersView.frame.width, height: contentHeight)
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
        getResponse()
        showCards()
        charactersView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentContainer)        
    }
    
}
extension CharactersViewController {
    private func showCards() {
        for (index, card) in words.enumerated() {
            let cardWidth: Int = Int((charactersView.frame.size.width - 30) / 3);
            let x = (cardWidth + 15) * (index%3);
            let y = 175 * (index/3);
            let cardView = UIButton(frame: CGRect(x: x, y: y, width: cardWidth, height: 160))
            cardView.backgroundColor = .red
            cardView.layer.cornerRadius = 10
            cardView.layer.masksToBounds = true;
            contentContainer.addSubview(cardView)
            
            //            contentView.frame.size = contentSize
            //
            //            print(contentSize.height)
        }
    }
    
    //    private func charactersCards () {
    //        for (index, word) in words.enumerated() {
    //            let cardWidth: Int = Int((charactersView.frame.size.width - 30) / 3);
    //            let x = (cardWidth + 15) * (index%3);
    //            let y = 175 * (index/3);
    //            let card = UIButton(frame: CGRect(x: x, y: y, width: cardWidth, height: 160))
    //            card.backgroundColor = .red
    //            card.layer.cornerRadius = 10
    //            card.layer.masksToBounds = true;
    //            contentContainer.addSubview(card)
    //        }
    //    }
}

struct Character: Codable{
    let info : CharactersInfo
    let results : [ResultsItem]
}
struct ResultsItem: Codable{
    let gender: String
    let id: Int
    let image: String
    let name: String
    let species: String
    let status: String
}
struct CharactersInfo: Codable {
    let count: Int;
}



