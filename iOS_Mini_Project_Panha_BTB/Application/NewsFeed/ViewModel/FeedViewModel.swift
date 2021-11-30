//
//  FeedViewModel.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 29/11/21.
//

import Foundation
struct FeedViewModel {
    
    static let shared = FeedViewModel()
    
    func fetch(completion: @escaping ([ArticleModel])->()){
        Network.shared.fetchArticles { result in
                switch result {
                    case .success(let articles):
                    print("Successfull")
                    var modelArticles: [ArticleModel] = articles.compactMap(ArticleModel.init)
                        completion(modelArticles)
                    case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        }
    }
}
