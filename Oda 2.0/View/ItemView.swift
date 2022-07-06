import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    @Binding var total: Double
    @Binding var itemsInCart: Int
    @State var itemCount: Int = 0{
        didSet{
            if itemCount > 0 {
                itemState = .overZero
            } else {
                itemState = .zero
            }
        }
    }
    @State var itemState: ItemState = .zero
    @State private var largeView = false

    
    var item: Product
        
    var body: some View{
                HStack{
                WebImage(url: URL(string: item.images[0].thumbnail.url))
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        largeView = true
                        print(item.images[0].thumbnail.url)
                    }
            .frame(maxWidth: 56, maxHeight: 56)
            VStack(alignment: .leading){
                Text("\(item.name)")
                    .font(.mediumFont)
                Text("\(item.nameExtra)")
                    .font(.regularFont)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack{
                switch itemState {
                case .zero:
                    VStack(alignment: .trailing){
                        Text("\(item.grossPrice)kr")
                            .font(.mediumFont)
                        Text("\(item.grossUnitPrice)/\(item.unitPriceQuantityAbbreviation)")
                            .foregroundColor(.gray)
                            .font(.regularFont)
                    }
                    Button {
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.orange)
                    }.onTapGesture {
                        total += Double(item.grossPrice)!
                        itemCount += 1
                        itemsInCart += 1
                    }
                
                case .overZero:
                    Button {} label: {
                        Image(systemName: "minus.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }.onTapGesture {
                        total -= Double(item.grossPrice)!
                        itemCount -= 1
                        itemsInCart -= 1
                    }
                    Text("\(itemCount)")
                    Button {} label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }.onTapGesture {
                        total += Double(item.grossPrice)!
                        itemCount += 1
                        itemsInCart += 1
                    }
                }
            }
                }
                .padding(.vertical, 5)
        .fullScreenCover(isPresented: $largeView, content: {
            ItemDetailView(image: item.images[0].large.url)
                }
        )
    }
}


enum ItemState {
    case overZero
    case zero
}
