//
//  GetJson.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 01.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation


class GetJson {
    
    var charactersCards: [ResultsItem] = [];
    
    func getResponse(completion: @escaping (_ data: [ResultsItem]) -> Void) -> Void {
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
                completion(self.charactersCards)
            } catch {
                print(error)
            }
        }.resume()
    }
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
