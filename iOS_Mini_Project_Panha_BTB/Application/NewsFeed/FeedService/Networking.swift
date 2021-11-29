//
//  Networking.swift
//  iOS_Mini_Project_Panha_BTB
//
//  Created by BTB_001 on 29/11/21.
//

import Foundation
import Alamofire
import SwiftyJSON


enum NetworkingError: Error {
    case invalidURL
    case noResponse
    case unknownError
}

struct Network {
    static let shared = Network()
    
   
    
    
    
    let baseURL = "http://110.74.194.124:3034/api"
    func postArticle(title: String?, description: String?,completion: @escaping(Result<String, Error>)->()){
        let article: [String:Any] = [
            "title": title ?? "no title",
            "description": description ?? "no description"
        ]
        AF.request("\(baseURL)/articles",method: .post, parameters: article, encoding: JSONEncoding.default).response { response in
        }
    }
    
    
   
    
    
    func uploadImage(imageData: Data?,completion: @escaping(String?)->()){
        if let safeData = imageData {
            AF.upload(multipartFormData: { multiform in
                multiform.append(safeData, withName: "image", fileName: "ams", mimeType: "image/jpeg")
            }, to: "\(baseURL)/images").response { response in
                if let error = response.error{
                    print(error.localizedDescription)
                }
                if let data = response.data {
                    let jsonData = try! JSON(data: data)
                    print(jsonData)
                    let url = jsonData["url"].stringValue
                    completion(url)
                }
            }
        }else{
            completion(nil)
        }
    }
    
    
    
    
    
    
    func removeArticles(id: String?) {
        AF.request("\(baseURL)/articles/\(id ?? "")", method: .delete).response
        { response in
            if let error = response.error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
    
    func fetchArticles(completion: @escaping(Result<[Article],Error>)->()){
        
        AF.request("\(baseURL)/articles").response { response in
            
            if let error = response.error {
                completion(.failure(error))
            }
            guard let safeData = response.data else{
                completion(.failure(NetworkingError.noResponse))
                return
            }
            do{
                var articles:[Article] = []
                let jsonData = try JSON(data: safeData)
                for jsonArticle in jsonData["data"].arrayValue {
                    let article = Article(json: jsonArticle)
                    articles.append(article)
                }
                completion(.success(articles))
                
            }catch let err {
                completion(.failure(err))
            }
            
        }
    }
    
}
