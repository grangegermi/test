//
//  File.swift
//  task
//
//  Created by Даша Волошина on 19.03.23.
//

import Foundation
import SwiftUI

struct TabItmes: Identifiable {
    var tab:Tab
    var id  = UUID()
}

var items: [TabItmes] = [TabItmes(tab: .page1),
                         TabItmes(tab: .like),
                         TabItmes(tab: .trash),
                         TabItmes(tab: .comments),
                         TabItmes(tab: .page2)]

enum Tab:String {
    
    case page1
    case like
    case trash
    case comments
    case page2

}

enum Page:String {
    
    case page1
}

var pages:[PageItems] = [PageItems(page: .page1)]

struct PageItems:Identifiable {
    var page:Page
    var id  = UUID() 
    
}
