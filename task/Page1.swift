//
//  Page1.swift
//  task
//
//  Created by Даша Волошина on 17.03.23.
//

import SwiftUI

struct Page1: View {
    @State  var text = ""
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var viewModel1 = InconsModel()
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing: 10){
                //Navbar
                HStack(spacing: 42){
                    Image("menu")
                    HStack(spacing: 5){
                        Text ("Trade by")
                            .font(.custom("Montserrat-SemiBold",
                                          size: 24))
                            .foregroundColor(Color.black)
                        Text (" bata")
                            .font(.custom("Montserrat-SemiBold",
                                          size: 24))
                            .foregroundColor(Color.init(red: 78/255, green: 85/255, blue: 215/255))
                    }
                    //photo
                    VStack(spacing:5){
                        Image("man")
                        HStack{
                            Text("Location")
                                .font(.custom("Montserrat-Regular",
                                              size: 14))
                                .foregroundColor(Color.black)
                            Image("array")
                            
                        }
                    }
                }
                HStack(spacing: -20){
                    TextField("What are you looking for?", text: $text)
                        .multilineTextAlignment(.center)
                        .font(.custom("Montserrat-Regular",size: 14))
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.init(red: 91/255, green: 91/255, blue: 91/255))
                    
                        .frame(width: 40, height: 40)
                }
                .background(Color.init(red: 245/255, green: 246/255, blue: 247/255))
                .cornerRadius(140)
                .frame(width: 300,height: 44)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(viewModel1.icons) { icon in
                            IconsView(icon: icon)
                        }
                        .padding(.horizontal, 10)
                    }
                }
                
                Text ("Latest")
                    .font(.custom("Montserrat-SemiBold",size: 18))
                    .padding(.leading, -180)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                       
                            ForEach(viewModel.modelLastes, id: \.self) { model in
                                CellForView(content: model)
                            }
                            .padding(.horizontal, 10)  
                    }
                }
                Text ("Flash Sale")
                    .font(.custom("Montserrat-SemiBold",size: 18))
                    .padding(.leading, -180)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(viewModel.modelFlash, id: \.self) { model in
                            CellForFlash(flash: model)
                        }
                        
                        .padding(.horizontal, 10)
                    }
                }
                Text ("Brands")
                    .font(.custom("Montserrat-SemiBold",size: 18))
                    .padding(.leading, -180)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(viewModel.modelLastes, id: \.self) { model in
                            CellForView(content: model)
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            
        }
    }
}





struct Icon:Identifiable {
    var text:String
    var image: String
    var id = UUID()
}

struct IconsView: View {
    
    var icon:Icon
    var body: some View {
        
        VStack(spacing: 14){
            Image(icon.image)
                .frame(width: 40,height: 40)
                .background(Color.init(red: 238/255, green: 239/255, blue: 244/255))
                .cornerRadius(20)
            Text(icon.text)
                .font(.custom("Montserrat-Regular",size: 10))
                .foregroundColor(Color.init(red: 166/255, green: 167/255, blue: 171/255))
        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
