//
//  ItemDetailView.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 17/02/2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct ItemDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let image: String
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
        WebImage(url: URL(string: image))
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 56, maxHeight: 56)

        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Label("Close", systemImage: "xmark.circle")
        }
                
    }
    }
}
}
