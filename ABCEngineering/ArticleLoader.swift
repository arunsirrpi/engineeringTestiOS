//
//  ArticleLoader.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import Foundation

class ArticleLoader {
    let session: Loader
    
    init(session:Loader = URLSession.shared) {
        self.session = session
    }
    
    func loadArticles(completionHandler: @escaping (([Article]?, Error?) -> Void)) {
        session.load { data, error in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let articles = try decoder.decode([Article].self, from: data)
                completionHandler(articles, nil)
            }
            catch {
                completionHandler(nil, error)
            }
        }
    }
}
