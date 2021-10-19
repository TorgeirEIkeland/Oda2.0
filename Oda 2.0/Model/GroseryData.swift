//
//  GroseryData.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 17/10/2021.
//

import Foundation

struct Root: Codable {
  let items: [Item]
}
struct Item: Codable {
  let product: Product
}
struct Product: Codable, Hashable {
  let name: String
  let name_extra: String
  let gross_price: String
  let gross_unit_price: String
}

class ShoppingViewModel: ObservableObject {
   
  @Published var productArray: [Product] = []
   
  // URL and data fetching
  let urlString: String = "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"
   
  func fetchData() {
     
    guard let url = URL(string: urlString) else {
      return
    }
     
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
       
      guard let data = data, error == nil else {
        return
      }
       
      do {
        let result = try JSONDecoder().decode(Root.self, from: data)
        DispatchQueue.main.async {
          self.productArray = result.items.map{$0.product}
        }
         
      } catch {
        print(error)
      }
    }
    task.resume()
  }
}
