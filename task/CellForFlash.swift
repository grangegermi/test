//
//  CellForFlash.swift
//  task
//
//  Created by Даша Волошина on 21.03.23.
//

import SwiftUI

struct CellForFlash: View {
    let flash:FlashSale
    var body: some View {
        AsyncImage(url: flash.imageURL)  { image in
            image
                .image?
                .resizable()
                .frame(width: 174, height: 221)
                .cornerRadius(10)
                .overlay {
                    VStack{
                    }
                    .frame(width: 174, height: 221)
                    .background(Color.black .opacity(0.35))
                    .cornerRadius(10)
                    HStack(spacing: 70){
                        Image("some man")
                        HStack{
                            Text ("\(flash.discount)% off")
                                .font(.custom("Montserrat-SemiBold",
                                              size: 12))
                                .foregroundColor(Color.white)
                                .frame(alignment: .center)
                            
                        }
                        .frame(width: 60, height: 20)
                        .background(Color.init(red: 249/255, green: 58/255, blue: 58/255, opacity: 100), in: RoundedRectangle(cornerRadius: 10,  style: .continuous))
                    }
                    .padding(.vertical, -100)
                    .padding(.leading, 7)
                    HStack{
                        Text (flash.category)
                            .font(.custom("Montserrat-SemiBold",
                                          size: 14))
                            .foregroundColor(Color.black)
                            .frame(alignment: .center)
                        
                    }
                    .frame(width: 80, height: 20)
                    
                    .background(Color.init(red: 196/255, green: 196/255, blue: 196/255, opacity: 0.85), in: RoundedRectangle(cornerRadius: 10,  style: .continuous))
                    .padding(EdgeInsets(top: -10, leading:-70, bottom: 10, trailing: 0))
                    VStack(alignment: .leading,spacing: 20){
                        Text(flash.name)
                            .foregroundColor(.white)
                            .frame(alignment: .leading)
                            .lineLimit(4)
                            .font(.custom("Montserrat-SemiBold",
                                          size: 16))
                        HStack(spacing:40){
                            HStack{
                                Text(String(format: "%g", flash.price))
                                    .frame(alignment: .leading)
                                    .font(.custom("Montserrat-SemiBold",
                                                  size: 16))
                                    .foregroundColor(Color.white)
                                Text("$")
                                    .font(.custom("Montserrat-SemiBold",
                                                  size: 16))
                                    .foregroundColor(Color.white)
                            }
                            HStack(spacing:10){
                                ZStack{
                                    Image("heart2")
                                        .padding(6)
                                }
                                .background(Color.init(red: 196/255, green: 196/255, blue: 196/255, opacity: 100), in: RoundedRectangle(cornerRadius: 20,  style: .circular))
                                Image("plus")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                
                            }
                            
                        }
                        
                    }
                    .padding(.top, 120)
                    .padding(.horizontal, -1)
                }
            
        }
    }
}

//struct CellForFlash_Previews: PreviewProvider {
//    static var previews: some View {
//        CellForFlash()
//    }
//}
