//
//  CellForView.swift
//  task
//
//  Created by Даша Волошина on 20.03.23.
//

import SwiftUI

struct CellForView: View {
    let content: Latest
    var body: some View {
        AsyncImage(url: content.image_url) { image in
            image
                .image?
                .resizable()
                .frame(width: 140, height: 180)
                .cornerRadius(10)
                .overlay {
                    VStack{
                    }
                    .frame(width: 140, height: 180)
                    .background(Color.black .opacity(0.35))
                    .cornerRadius(10)
                    HStack{
                        Text (content.category)
                            .font(.custom("Montserrat-SemiBold",
                                          size: 14))
                            .foregroundColor(Color.black)
                            .frame(alignment: .center)
                        
                    }
                    .frame(width: 80, height: 20)
                    
                    .background(Color.init(red: 196/255, green: 196/255, blue: 196/255, opacity: 0.85), in: RoundedRectangle(cornerRadius: 10,  style: .continuous))
                    .padding(EdgeInsets(top: -20, leading:-40, bottom: 10, trailing: 0))
                    VStack(alignment: .leading,spacing: 10){
                        Text(content.name)
                            .foregroundColor(.white)
                            .frame(alignment: .leading)
                            .lineLimit(2)
                            .font(.custom("Montserrat-SemiBold",
                                          size: 18))
                        HStack(spacing:50){
                            Text("\(content.price)$")
                                .frame(alignment: .leading)
                                .font(.custom("Montserrat-SemiBold",
                                              size: 16))
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color.init(red: 229/255, green: 233/255, blue: 239/255, opacity: 0.85))
                                .frame(width: 20,height: 20)
                        }
                        
                    }
                    .padding(.top, 90)
                }
            
        }
    }
    
}

//struct CellForView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellForView()
//    }
//}
