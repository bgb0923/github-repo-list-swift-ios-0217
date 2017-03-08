//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String : Any]]) -> Void) {
        let urlString = "https://api.github.com/repositories?client_id=\(Github.ID)&client_secret=\(Github.secret)"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error)  in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] ?? [[:]]
                        completion(json)
                    } catch {
                        
                    }
                }
            })
            dataTask.resume()
        }
    }
}



