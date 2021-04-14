//
//  Loader.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 23/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import Foundation

protocol Loader {
    func load(completionHandler: @escaping (Data?, Error?) -> Void)
}
