//
//  ArticleListTableViewController.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import UIKit

class ArticleListTableViewController: UITableViewController {
    
    var loader = ArticleLoader()
    var articles = [Article]()
    var error: Error?

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshControlValueChanged), for: .valueChanged)
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier:"reuseIdentifierA" )
        load()
    }
    
    func load() {
        self.tableView.refreshControl?.beginRefreshing()
        loader.loadArticles { articles, error in
            if let uArticles = articles {
                self.articles = uArticles
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            } else {
                // error not handled in this exercise
                fatalError()
            }
        }
    }
    
    @objc func refreshControlValueChanged() {
        guard let refreshControl = refreshControl, refreshControl.isRefreshing else { return }
        load()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierA", for: indexPath) as? ArticleTableViewCell else {
            fatalError()
        }

        // Configure the cell...
        let article = articles[indexPath.row]
        cell.title.text = article.title
        cell.synopsis.text = article.synopsis
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        cell.date.text = formatter.string(from: article.publishedDate)

        return cell
    }

}
