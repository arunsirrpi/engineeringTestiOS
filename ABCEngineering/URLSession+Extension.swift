//
//  URLSession+Extension.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import Foundation

extension URLSession: Loader {
    
    func load(completionHandler: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let data = URLSession.stubData
            sleep(2)
            completionHandler(data, nil)
            
        }
    }
    
    private static var stubData: Data {
        return """
                [
                {
                "publishedDate": "2018-11-13T04:13:07Z",
                "title": "When will you get the NBN?",
                "synopsis": "For the first time, Australians will be able to check when the NBN network will be available in their area, after an update to the company's website.",
                "href": "http://app.abc.net.au/news/8370590"
                },
                {
                "publishedDate": "2018-11-12T04:13:07Z",
                "title": "Bill Paxton dies at 61",
                "synopsis": "iBill Paxton, the only actor killed on screen by a Predator, a Terminator and an Alien, died at age 61 after complications from surgery.",
                "href": "http://app.abc.net.au/news/8305396"
                },
                {
                "publishedDate": "2018-11-12T02:49:47Z",
                "title": "Live: Turnbull and Shorten trade barbs over penalty rates",
                "synopsis": "Prime Minister Malcolm Turnbull and Opposition Leader Bill Shorten swap insults over penalty rates, with both parties accusing the other of hypocrisy. Follow live.",
                "href": "http://app.abc.net.au/news/8370590"
                },
                {
                "publishedDate": "2018-11-11T04:03:07Z",
                "title": "Live: All the action from the Oscars",
                "synopsis": "The 89th Academy Awards are underway in Hollywood, with musical favourite La La Land tipped to dominate on a night that could see the stars get political. Follow live.",
                "href": "http://app.abc.net.au/news/8370590"
                },
                {
                "publishedDate": "2018-11-10T04:13:07Z",
                "title": "One Nation threatens LNP amid calls for conservative Coalition",
                "synopsis": "Support for One Nation and the Liberal National Party is neck and neck in the Queensland seat of Dawson, which is currently held by fractious LNP MP George Christensen — who has repeatedly threatened to leave the party if it does not return to its conservative roots.",
                "href": "http://app.abc.net.au/news/8370590"
                },
                {
                "publishedDate": "2018-11-10T03:13:07Z",
                "title": "Adani director appointed to body overseeing mining giant's coal port",
                "synopsis": "Despite being warned of potential conflicts of interest, the Queensland Government appointed an Adani company director to chair the authority overseeing the Abbot Point coal port.",
                "href": "http://app.abc.net.au/news/8370590"
                }
                ]
                """.data(using: .utf8)!
    }
    
}
