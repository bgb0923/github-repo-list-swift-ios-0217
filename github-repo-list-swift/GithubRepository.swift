//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

import UIKit

class GithubRepository {
    
    let fullName: String
    var htmlURL: URL?
    let repositoryID: String
    
    init(dictionary: [String:Any]) {
        self.fullName = dictionary["full_name"] as? String ?? "No Name"
        
        // self.repositoryID = dictionary["id"] as? String ?? "No Repo ID" Why doesn't this line work?
        self.repositoryID = String(describing: dictionary["id"] ?? "No Repo ID")
        
        // why does the below return an optional?
        if let owner = dictionary["owner"] as? [String:Any] {
            let urlString = owner["html_url"] as? String ?? "No URL"
            if let unwrappedURL = URL(string: urlString) {
                self.htmlURL = unwrappedURL
            }
        }
    }
}
