//
//  Article.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import Foundation

struct Article: Codable {
    let title: String
    let synopsis: String
    let href: String
    let publishedDate: Date
}
