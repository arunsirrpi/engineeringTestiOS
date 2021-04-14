//
//  ArticleLoaderTests.swift
//  ABCEngineeringTests
//
//  Created by Arun Sinthanaisirrpi on 23/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import XCTest

class ArticleLoaderTests: XCTestCase, Loader {

    var sut: ArticleLoader?
    
    func testArticleLoaderLoadingCorrectly() {
        /// Given
        sut = ArticleLoader()
        
        ///When
        let articlesLoadedExpectation = XCTestExpectation(description: "articles loaded")
        sut?.loadArticles(completionHandler: { (articles, error) in
            
            //Then
            XCTAssertNotNil(articles)
            XCTAssertTrue(articles?.count == 1)
            let article = articles?.first
            XCTAssertEqual(article?.title, .some("some title"))
            XCTAssertEqual(article?.href, .some("some href link"))
            
            articlesLoadedExpectation.fulfill()
        })
        
        wait(for: [articlesLoadedExpectation], timeout: 3)
    }

}

extension ArticleLoaderTests {
  
    func load(completionHandler: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let data = ArticleLoaderTests.stubData
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                completionHandler(data, nil)
            }
        }
    }
    
    private static var stubData: Data {
        return """
                [
                {
                "publishedDate": "2018-11-13T04:13:07Z",
                "title": "some title",
                "synopsis": "some synopsis.",
                "href": "some href link"
                }
                ]
                """.data(using: .utf8)!
    }
    
}
