//
//  CellForList.swift
//  task
//
//  Created by Даша Волошина on 21.03.23.
//

import SwiftUI

struct Listes:Identifiable {
    var text:String
    var image:String
    var summa: String
    var id = UUID()
}
class ViewModelCell: ObservableObject{
    @Published var model1:[Listes] = [Listes(text: "Trade Store", image: "card", summa: "Vector 1"),
                                      Listes(text: "Payment method", image: "card", summa: "Vector 1")]
    
    
    
    
    @Published var model2:[Listes] = [Listes(text: "Balance", image: "card" , summa: "$1593")]
    
    @Published var model3:[Listes] = [ Listes(text: "Trade history", image: "card", summa: "Vector 1"),
                                       Listes(text: "Restore purchase", image: "arrow", summa: "Vector 1")]
    
    @Published var model4:[Listes] = [Listes(text: "Help", image: "question", summa: ""),
                                      Listes(text: "Log out", image: "logout", summa: "")]
    
}

struct CellForList: View {
    var item:Listes
    var body: some View {
        HStack(spacing:90){
            Button {
                
            } label: {
                HStack(spacing:10){
                    Image(item.image)
                        .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
                    Text(item.text)
                        .font(.custom("Montserrat-Regular",
                                      size: 14))
                        .frame(width: 200, alignment: .leading)
                        .foregroundColor(.black)
                        .lineLimit(0)
                    
                        .foregroundColor(.black)
                }
            }
            HStack{
                Image(item.summa)
                    .frame(alignment: .trailing)
            }
        }
    }
}


struct CellForList2: View {
    var item:Listes
    
    var body: some View {
        
        HStack(spacing:50){
            Button {
                
            } label: {
                HStack(spacing:10){
                    Image(item.image)
                        .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
                    Text(item.text)
                        .font(.custom("Montserrat-Regular",
                                      size: 14))
                        .frame(width: 200, alignment: .leading)
                        .foregroundColor(.black)
                        .lineLimit(0)
                        .foregroundColor(.black)
                }
            }
            
            HStack{
                Text(item.summa)
                    .frame(alignment: .trailing)
            }
        }
    }
}

struct CellForList3: View {
    var item:Listes

    @State private var showingSheet = false
    var body: some View {
        HStack(spacing:90){
            HStack(spacing:10){
                Button(action: {
                    gotoSingIN()
                }, label: {
                    Image(item.image)
                        .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
                    Text(item.text)
                        .font(.custom("Montserrat-Regular",
                                      size: 14))
                        .frame(width: 200, alignment: .leading)
                        .foregroundColor(.black)
                        .lineLimit(0)
                        .foregroundColor(.black)
                })
            }
            
            HStack{
                Image(item.summa)
                    .frame(alignment: .trailing)
            }
        }
    }
}




//}

//struct CellForList_Previews: PreviewProvider {
//    static var previews: some View {
//        CellForList()
//    }
//}
