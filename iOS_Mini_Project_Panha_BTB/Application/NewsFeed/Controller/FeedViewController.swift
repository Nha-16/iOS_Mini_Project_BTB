//
//  FeedViewController.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 29/11/21.
//

import UIKit
import ProgressHUD
import SwiftyJSON
import ProgressHUD
import Alamofire
class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var article: [ArticleModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        fetch()
        fetchs()
    }
    @objc func refresh(){
        fetch()
    }
    func fetchs(){
        FeedViewModel.shared.fetch {[weak self] articles in
            self?.article = articles
            self?.tableView.reloadData()
        }
    }
    func fetch(){
        ProgressHUD.show()
        Network.shared.fetchArticles { result in
            switch result{
            case .success(let articles):
                
                ProgressHUD.showSucceed("Get data successfully")
                self.tableView.refreshControl?.endRefreshing()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.article.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        
        cell.config(articles: self.article[indexPath.row])
        return cell
    }
}

