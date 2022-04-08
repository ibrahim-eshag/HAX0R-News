//
//  PostData.swift
//  HAX0R News
//
//  Created by Amged on 4/9/22.
//

import Foundation


struct Results: Decodable{
    let hits: [Post]
}



struct Post: Decodable, Identifiable{
    
    var id: String {  // id is required for the DataStructure to Identifiable
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
