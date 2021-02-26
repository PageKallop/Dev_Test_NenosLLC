//
//  Posts.swift
//  SpringChallengeP.K.
//
//  Created by Page Kallop on 2/23/21.
//

import Foundation
//represents the structure of json data 

struct UserPost: Codable {
    
    let posts : [Posts]
}

struct Posts: Codable {

    let id : UUID 
    let date : String
    let longitude : Double
    let latitude : Double
    let isFollowing : Bool
    let potentialMisinformation : Int
    let caption : String
    let tags : [String]
    
}

struct Tags : Codable {
    
    var tags : [String]
}






