//
//  PostsToLoad.swift
//  SpringChallengeP.K.
//
//  Created by Page Kallop on 2/23/21.
//

import Foundation

struct PostsToLoad {
    
    var userPost = [UserPost]()
    

    //initializes the function 
    init() {
        loadPost()
        
    }
    //reads the file and returns the data of the file
    func loadPost() {
        
        if let fileLocation = Bundle.main.url(forResource: "Posts", withExtension: "json") {
            print(fileLocation)
            do {
                
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(UserPost.self, from: data)
                let newPost = dataFromJson.posts
                
               
                //create constant to compare to post
                let informationStandard = 0
                let isFollowing = true
                let usedTags = ["summer","food", "couples","museum"]


                //filters the potentialMisinformation against constant
                let informationParameter = newPost.filter { $0.potentialMisinformation == informationStandard }
                //compare the ifFollowing against constant
                let isFollowingParameter = informationParameter.filter { $0.isFollowing == isFollowing}
                //filters users tags against post tags
                let finalCompare = isFollowingParameter.filter { $0.tags.contains(where: {usedTags.contains($0)})}
                //puts post in order of most recent
                let dateOrder = finalCompare.sorted(by:{ $0.date.compare($1.date) == .orderedDescending })
                
       
               
                //print the sorted data
                print("The filtered post\(dateOrder)")
            
                
            } catch {
                //print errors
                print("couldn't decode json\(error)")
            }
         
         
        }
       
    }

    
}




