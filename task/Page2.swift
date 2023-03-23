//
//  Page2.swift
//  task
//
//  Created by Даша Волошина on 17.03.23.
//

import SwiftUI
import PhotosUI

struct Page2: View {
    @AppStorage("selectedTab") var selecetedTab:Tab = .page2
    @State var selectionItems:[PhotosPickerItem] = []
    @State var data:Data?
    
    @ObservedObject var viewModel = ViewModelCell()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 10){
                VStack(spacing:20){
                    Text("Profile")
                        .font(.custom("Montserrat-SemiBold",
                                      size: 18))
                    
                    if let data  =  data, let uiImage = UIImage(data: data){
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(40)
                    } else {
                        Image("man2")
                            .frame(width: 80, height: 80)
                    }
                    
                    PhotosPicker(
                        selection: $selectionItems,
                        matching: .images
                    ) {
                        
                        Text("Change photo")
                            .font(.custom("Montserrat-Regular",
                                          size: 12))
                            .foregroundColor(Color.init(red: 128/255, green: 128/255, blue: 128/255, opacity: 100))
                    }
                    .onChange(of:selectionItems){ newItem in
                        guard let item = selectionItems.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result  in
                            switch result {
                            case.success(let data):
                                if let data = data {
                                    self.data = data
                                }
                            case.failure(let error):
                                print(error)
                            }
                        }
                        
                    }
                    
                    Text("Satria Adhi Pranada")
                        .font(.custom("Montserrat-SemiBold",
                                      size: 14))
                    
                    Button (action: {
                        
                    }, label: {
                        
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color.white)
                            .frame(alignment: .leading)
                            .padding(.leading, -50)
                        Text("Upload item")
                            .foregroundColor(Color.white)
                            .font(.custom("Montserrat-SemiBold",
                                          size: 14))
                            .frame(alignment: .center)
                        
                    })
                    
                    .frame(width: 290, height: 40)
                    .background(Color.init(red: 78/255, green: 85/255, blue: 215/255, opacity: 100), in: RoundedRectangle(cornerRadius: 10,  style: .continuous))
                    
                }
                VStack(alignment: .leading, spacing: 20){
                    
                    ForEach(viewModel.model1) { model in
                        
                        CellForList3(item: model)

                    }
                    ForEach(viewModel.model2) { model in
                        
                        CellForList2(item: model)
                        
                    }
                    
                    ForEach(viewModel.model3) { model in
                        CellForList3(item: model)
                        
                    }
                    .listRowBackground(Color.init(red: 250/255, green: 249/255, blue: 255/255))
                    
                    ForEach(viewModel.model4) { model in
                        
                        CellForList3(item: model)
                        
                    }
                    
                    .listStyle(.inset)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.init(red: 250/255, green: 249/255, blue: 255/255))
            
        }
    }
}


struct Page2_Previews: PreviewProvider {
    static var previews: some View {
        Page2()
    }
}
