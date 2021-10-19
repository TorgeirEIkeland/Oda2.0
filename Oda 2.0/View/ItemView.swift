//
//  ItemView.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var buttonViewModel: ButtonViewModel = ButtonViewModel()
    var item: Product
    var body: some View{
        HStack{
            WebImage(url: URL(string: item.images[0].thumbnail.url))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 56, maxHeight: 56)
            
            VStack(alignment: .leading){
                Text("\(item.name)")
                    .font(.mediumFont)
                Text("\(item.name)")
                    .font(.regularFont)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack{
                switch buttonViewModel.itemState {
                case .zero:
                    VStack(alignment: .trailing){
                        Text("\(item.gross_price)kr")
                            .font(.mediumFont)
                        Text("\(item.gross_unit_price)/\(item.unit_price_quantity_abbreviation)")
                            .foregroundColor(.gray)
                            .font(.regularFont)
                    }
                    Button {
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.orange)
                    }.onTapGesture {
                        viewModel.addItem(price: item.gross_price)
                        buttonViewModel.plus()
                    }
                
                case .overZero:
                    Button {} label: {
                        Image(systemName: "minus.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }.onTapGesture {
                        viewModel.removeItem(price: item.gross_price)
                        buttonViewModel.minus()
                    }
                    Text("\(buttonViewModel.itemCount)")
                    Button {} label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }.onTapGesture {
                        viewModel.addItem(price: item.gross_price )
                        buttonViewModel.plus()
                    }
                }
            }
        }
    }
    
}


