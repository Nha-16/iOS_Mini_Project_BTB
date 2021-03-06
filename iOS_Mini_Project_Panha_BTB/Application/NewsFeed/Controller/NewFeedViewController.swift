//
//  ViewController.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 24/11/21.
//

import UIKit
import SwiftyJSON
import ProgressHUD
import Alamofire

class NewFeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [ArticleModel] = []
    var imageData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        fetch()
        fetchs()
    }
    @objc func refresh(){
        fetch()
    }
    func fetchs(){
        NewFeedViewModel.shared.fetch {[weak self] articles in
            self?.articles = articles
            print("catch me if you can", articles)
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

extension NewFeedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewFeedTableViewCell
        
        cell.config(articles: self.articles[indexPath.row])
        print("test", articles)
        return cell
    }
}
