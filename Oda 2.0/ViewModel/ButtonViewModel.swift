//
//  ItemViewModel.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import Foundation
import SwiftUI

class ButtonViewModel: ObservableObject {
    @Published var itemState: ItemState = .zero
    @Published var itemCount: Int = 0{
        didSet{
            if itemCount > 0 {
                itemState = .overZero
                print(itemCount)
            } else {
                itemState = .zero
                print(itemCount)
            }
        }}
    
    func minus(){
        itemCount -= 1
    }
    
    func plus(){
        itemCount += 1
    }
    
    enum ItemState {
        case overZero
        case zero
    }
    
    
}
