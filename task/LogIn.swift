//
//  LogIn.swift
//  task
//
//  Created by Даша Волошина on 17.03.23.
//

import Foundation
import SwiftUI


struct LogIn: View {
    
    @StateObject var userModel = PersistenceController()
    @State var firstName = ""
    @State var password = ""
    @State var selected = false
    @State private var presentAlert = false
    
    var body: some View {
      
            VStack {
                Text("Welcome  Back")
                    .font(.custom("Montserrat-SemiBold",
                                  size: 36))
                    .tint(Color("titleColor"))
                
                VStack{
                    TextField("First name", text:$firstName)
                    
                        .multilineTextAlignment(.center)
                        .font(.custom("Montserrat-Regular",size: 20))
                        .background(Color("textFieldColor"))
                        .cornerRadius(15)
                        .frame(width: 289,height: 29)
                        .autocorrectionDisabled()
                    HStack(spacing: -40) {
                        if selected {
                            TextField("Password", text: $password)
                                .multilineTextAlignment(.center)
                                .font(.custom("Montserrat-Regular",size: 20))
                                .frame(width: 279)
                        } else {
                            SecureField("Password", text: $password)
                                .multilineTextAlignment(.center)
                            
                                .font(.custom("Montserrat-Regular",size: 20))
                                .frame(width: 279)
                        }
                        Button {
                            selected.toggle()
                        }label:{
                            if selected == false {
                                Label("", image: "eye")
                                    .frame(width: 60, height: 40)
                                    .cornerRadius(40)
                            }
                            if selected == true{
                                Label("", systemImage: "eye")
                                    .foregroundColor(Color.gray)
                                    .frame(width: 60, height: 40)
                                    .cornerRadius(40)
                            }
                        }
                    }
                    .background(Color("textFieldColor"))
                    .frame(width: 300, height:30 )
                    .cornerRadius(100)
                    .padding(EdgeInsets(top: 35, leading: 0, bottom: 99, trailing: 0))
                    
                    Button(action: {
                        if !userModel.users.compactMap{$0.firstName}.contains(firstName){
                            presentAlert = true
                            print("ff")
                        }else {
                            gotoHome()
                        }
                        
                    }, label: {
                        Text("Sing in")
                            .font(.custom("Montserrat-Regular",size: 18))
                            .frame(width: 289, height: 46, alignment: .center)
                            .tint(Color.white)
                            .background(Color("buttonColor"))
                            .cornerRadius(15)
                    })
                    .alert("No such user exists", isPresented: $presentAlert, actions: {})
                    .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
                }
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 124, trailing: 0))
                
            }
           
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(top: 130, leading: 0, bottom: 124, trailing: 0))
            .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
        }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}


