//
//  ContentView.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var total: Double = 0.00
    @State var itemsInCart: Int = 0
    
    init() {
        viewModel.getData()
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(viewModel.productList){ item in
                        ItemView(total: self.$total, itemsInCart: $itemsInCart, item: item)
                    }
                }
                .listStyle(PlainListStyle())
                
                if itemsInCart != 0 {
                HStack{
                    Spacer()
                    Image(systemName: "cart")
                        .font(.system(size: 20))
                    Text("\(itemsInCart) products")
                        .font(.mediumFont)
                    
                    Spacer()
                    Spacer()
                    
                    Text(String(format: "Total: %.2fkr", total))
                        .font(.mediumFont)
                    Spacer()
                }
                }
                
            }
                .navigationTitle("Shopping Cart")
                .navigationBarTitleDisplayMode(.inline)

        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

