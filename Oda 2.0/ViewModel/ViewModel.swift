//
//  CartViewModel.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var totalPrice: Double = 0
    @Published var productList: [Product] = []
    
    func addItem(price: String){
        let newPrice: Double = Double(price)!
        totalPrice += newPrice
    }
    
    func removeItem(price: String){
        let newPrice: Double = Double(price)!
        totalPrice -= newPrice
    }
        
    func getData() {
        if let url = URL(string: "https://api.npoint.io/d4e0a014b1cfc5254bcb") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //MARK: convert from snakeCase to camelCase
                    if let safeData = data {
                        do {
                            print(safeData)
                            print("ssafe")
                            let results = try decoder.decode(ItemData.self, from: safeData)
                            DispatchQueue.main.async { [weak self] in
                                self?.productList = results.items.map { item in
                                    item.product
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
   
}
