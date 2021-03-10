//
//  PostData.swift
//  Hacker News
//
//  Created by Carlos Magno de França Veiga on 09/03/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}
//Identifiable - protocolo que permite que a List reconheça a ordem dos objetos Post com base na propriedade "id"
struct Post: Decodable, Identifiable {
    //variável calculada
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
