//
//  CollectionViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 01.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    

    
    
    var cardItem: [Container] = {
        var blank = Container()
        blank.name = "dsfkvjdk"
        blank.imageName = "characters"

        var blank1 = Container()
        blank1.name = "dsfkvjdk"
        blank1.imageName = "characters"

        var blank2 = Container()
        blank2.name = "dsfkvjdk"
        blank2.imageName = "characters"

        var blank3 = Container()
        blank3.name = "dsfkvjdk"
        blank3.imageName = "characters"

        return [blank, blank1, blank2, blank3]
    }()
    
    var cardsArray: [Container] = [];
    
    func getNewArr(json: [ResultsItem]) -> Void {
        var dataArray: [ResultsItem] = json;
        print("dataArray ", dataArray);
        
        for d in dataArray {
            var card = Container();
            card.name = d.name;
            card.imageName = d.image;
            cardsArray.append(card);
        }
        

//        collectionView.reloadItems(at: <#T##[IndexPath]#>)
//        collectionView.setNeedsLayout()
//        collectionView.layoutIfNeeded()
        
        //collectionView.cell
    }
    
    func getDataFromJson() -> Void {
        let json: GetJson = GetJson();
        json.getResponse(completion: getNewArr)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.dataSource = self as! UICollectionViewDataSource
        collectionView.delegate = self as! UICollectionViewDelegate
        getDataFromJson();
        
    }
    
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as? CollectionViewCell {
            itemCell.container = cardsArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }

}
