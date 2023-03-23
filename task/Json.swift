//
//  Json.swift
//  task
//
//  Created by Даша Волошина on 20.03.23.
//

import Foundation
import SwiftUI

struct Category:Decodable, Hashable {
    var latest: [Latest]

}

struct Latest:Decodable, Hashable {
    
    var category: String
    var name: String
    var price:Int
    var image_url:URL
//    var id = UUID()
}

struct Sale: Decodable,Hashable {
    let flashSale: [FlashSale]

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

// MARK: - FlashSale
struct FlashSale: Decodable,Hashable {
    let category, name: String
    let price: Float
    let discount: Int
    let imageURL: URL

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}

class ViewModel:ObservableObject {
    
    @Published var modelFlash: [FlashSale] = []
    @Published var modelLastes: [Latest] = []
    
    init(){
     
           self.getData ()            
    }
    
    func getData () {
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.main.async {
            ApiCaller.shared.getApi {[weak self] result in
                self?.modelLastes.append(contentsOf: result.latest)
                group.leave()
                
            }
        }
        group.enter()
        DispatchQueue.main.async {
            ApiCaller.shared.getFlashSale {[weak self] result in
                self?.modelFlash.append(contentsOf: result.flashSale)
                group.leave()
            }
        }
   
        group.notify(queue: .main) {
            if self.modelLastes.isEmpty {
                self.modelFlash.isEmpty
            }
            else{
                self.modelFlash.isEmpty
            }
        }
    }
}

class ApiCaller {
    
    static let shared = ApiCaller()
    private init(){}
    func getApi(completion:@escaping (Category) -> ()){
        var url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")
       
        
        guard let url = url else {return}
        var request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, error, _ in
            guard let data =  data else {return}
            do {
                let jsonData = try JSONDecoder().decode(Category.self, from: data)
                completion(jsonData)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getFlashSale(completion:@escaping(Sale)->()) {
        var url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")
        guard let url = url else {return}
        var request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, error, _ in
            
            guard let data = data else {return}
            do {
                let jsonData = try JSONDecoder().decode(Sale.self, from: data)
                completion(jsonData)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
