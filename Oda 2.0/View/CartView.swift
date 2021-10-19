//
//  ContentView.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        Text("Title")
        List{
            ForEach(viewModel.productList, id: \.self){ item in
                ItemView(viewModel: viewModel, item: item)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            viewModel.getData()
        }

        Text("Total: \(viewModel.totalPrice)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

