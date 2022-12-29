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
  
    var cardsArray: [Container] = [];
    
    func getNewArr(json: [ResultsItem], imageData: [Data]) -> Void {
        var dataArray: [ResultsItem] = json;
        var imageArray: [Data] = imageData;
        cardsArray = [];
        for i in 0...imageArray.count-1{
            var card = Container();
            card.name = dataArray[i].name;
            card.imageName = imageArray[i];
            cardsArray.append(card)
        }
       collectionView.reloadData()
    }
    
    func getDataFromJson() -> Void {
        let json: GetJson = GetJson();
        json.getResponse { [weak self] data in
            DispatchQueue.main.async {
                json.getImage(data: data){[weak self] imageData, images in
                    DispatchQueue.main.async {
                        self?.getNewArr(json: data, imageData: images)
                    }
                }               
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
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
