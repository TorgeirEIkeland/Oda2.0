//
//  CartViewModel.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import Foundation

class ViewModel: ObservableObject{
    
//    @Published var itemState: ItemState = .zero
//    @Published var itemCount: Int = 0{
//        didSet{
//            if itemCount > 0 {
//                itemState = .overZero
//                print(itemCount)
//            } else {
//                itemState = .zero
//                print(itemCount)
//            }
//        }}
//    
//    enum ItemState {
//        case overZero
//        case zero
//    }
    
    func addItem(price: String){
//        itemCount += 1
        guard let newPrice: Double = Double(price) else { return }
        totalPrice += newPrice
    }
    
    func removeItem(price: String){
//        itemCount -= 1
        guard let newPrice: Double = Double(price) else { return }
        totalPrice -= newPrice

    }
    
    
    @Published var totalPrice: Double = 0   
    @Published var productList: [Product] = []
    
    let url: String = "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"
    
    
    func getData() {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ItemData.self, from: data)
                DispatchQueue.main.async {
                    self.productList = result.items.map{$0.product}
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
