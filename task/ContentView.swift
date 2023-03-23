//
//  ContentView.swift
//  task
//
//  Created by Даша Волошина on 13.03.23.
//

import SwiftUI
import CoreData
  


struct ContentView: View {
    @AppStorage("selectedPage") var selectedPage:Page = .page1
    @StateObject var userModel = PersistenceController()
    @Environment(\.presentationMode) var presentation
    @State var firstName = ""
    @State var lastName = ""
    @ObservedObject var email = EmailValadation()
    @State private var isShowingDetailView = false
    
    @State private var presentAlert = false
    var body: some View {
        NavigationStack{
            
            VStack {
                Text("Sing in")
                    .padding(EdgeInsets(top: 90, leading: 0, bottom: 77, trailing: 0))
                    .font(.custom("Montserrat-SemiBold",
                                  size: 36))
                    .tint(Color("titleColor"))
                
                VStack(spacing: 30){
                    
                    TextField("First name", text:$firstName)
                    
                        .multilineTextAlignment(.center)
                        .font(.custom("Montserrat-Regular",size: 20))
                        .background(Color("textFieldColor"))
                        .cornerRadius(15)
                        .frame(width: 289,height: 29)
                        .autocorrectionDisabled()
                    TextField("Last name", text:$lastName)
                        .multilineTextAlignment(.center)
                        .font(.custom("Montserrat-Regular",size: 20))
                        .background(Color("textFieldColor"))
                        .cornerRadius(15)
                        .frame(width: 289)
                        .autocorrectionDisabled()
                    VStack(spacing:2){
                        
                        TextField("Email", text:$email.email)
                        
                            .multilineTextAlignment(.center)
                            .font(.custom("Montserrat-Regular",size: 20))
                            .background(Color("textFieldColor"))
                            .cornerRadius(15)
                            .frame(width: 289,height: 29)
                            .autocorrectionDisabled()
                        
                        Text(email.error).foregroundColor(.red)
                    }
                    
                    Button(action:  {
                        
                        
                        if userModel.users.compactMap({$0.firstName}).contains(firstName),
                           userModel.users.compactMap({$0.lastName}).contains(lastName),
                           userModel.users.compactMap({$0.email}).contains(email.email) {
                            presentAlert = true
                            
                            
                        } else {
                         gotoHome()
                            
                            userModel.addUser(email: email.email,
                                              firstName: firstName,
                                              lastName: lastName)
                        }
                        
                    }, label: {
                        Text("Sing in")
                            .font(.custom("Montserrat-Regular",size: 18))
                            .frame(width: 289, height: 46, alignment: .center)
                            .tint(Color.white)
                            .background(Color("buttonColor"))
                            .cornerRadius(15)
                    })
                    .alert("This user already exists", isPresented: $presentAlert, actions: {})
                    
                    HStack{
                        Text("Already have an account?")
                            .font(.custom("Montserrat-Regular",size: 14))
                            .foregroundColor(Color.gray)
                        
                        NavigationLink{
                            LogIn()
                        } label: {
                            Text("Log in")
                                .font(.custom("Montserrat-Regular",size: 14))
                                .foregroundColor(Color.init(red: 37/255, green: 79/255, blue: 230/255) .opacity(100))
                        }
                    }
                    
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 40))
                }
                
                .padding(EdgeInsets(top: 0, leading: 42, bottom: 0, trailing: 43))
                
                VStack(alignment: .center, spacing: 38){
                    HStack{
                        Image("google")
                            .frame(width: 24, height: 24)
                        Text("Sing with Google")
                            .font(.custom("Montserrat-Regular",size: 14))
                    }
                    HStack{
                        Image("apple")
                            .frame(width: 24, height: 24)
                        Text("Sing with Apple")
                            .font(.custom("Montserrat-Regular",size: 14))
                    }
                }
                .padding(EdgeInsets(top:0, leading: 0, bottom:90 , trailing: 0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

