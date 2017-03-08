//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {

    static let sharedInstance = ReposDataStore()
    private init() {}
    var repositories = [GithubRepository]()
    
    func getRepositories(_ completion: @escaping () -> Void) {
        self.repositories.removeAll()
        GithubAPIClient.getRepositories { (repos) in
            repos.forEach { self.repositories.append(GithubRepository(dictionary: $0))}
            completion()
        }
    }
}
