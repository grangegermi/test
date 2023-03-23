//
//  TabView.swift
//  task
//
//  Created by Даша Волошина on 17.03.23.
//

import SwiftUI

struct TableView: View {
    @AppStorage("selectedTab") var selecetedTab:Tab = .page1
    var body: some View {
        
        VStack{
            ZStack{
                switch selecetedTab {
                case .page1:
                    Page1()
                case .like:
                    Like()
                case .trash:
                    Trash()
                case .comments:
                    Comments()
                case .page2:
                    Page2()
           
                }
                Circle()
            }
        }
        
        .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
        .edgesIgnoringSafeArea(.bottom)
        
    }
}
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        
        TableView()
    }
}

struct Circle: View{
    @AppStorage("selectedTab") var selectionTab:Tab = .page2
    @State var state = false
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Button {
                    if state == false {
                        selectionTab = items[0].tab
                        state = true 
                    }
                }
                
            label: {
                
                Image("home")
                
            }
                Spacer(minLength:15)
                
                Button {
                    selectionTab = items[1].tab
                    
                } label: {
                    Image("heart")
                    
                }
                Spacer(minLength:15)
                
                Button {
                    selectionTab = items[2].tab
                } label: {
                    Image("trash")
                    
                }
                Spacer(minLength:15)
                
                Button {
                    selectionTab = items[3].tab
                } label: {
                    Image("comments")
                    
                }
                Spacer(minLength:15)
                
                
                Button {
                    if state == true {
                        selectionTab = items[4].tab
                         state = false
                    }
                    
                    
                    
                } label: {
                    Image("people")
                    
                }
                
            }
            .padding(.horizontal,50)
            .frame(height:60)
            .background(.white, in: RoundedRectangle(cornerRadius: 30,  style: .circular))
        }
    }
}
