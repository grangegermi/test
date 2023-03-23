//
//  Model.swift
//  task
//
//  Created by Даша Волошина on 16.03.23.
//

import Foundation

class InconsModel: ObservableObject{
    
    var icons: [Icon] = [Icon(text: "Phones", image: "phone"),
                                 Icon(text: "Headphones", image: "pods"),
                                 Icon(text: "Games", image: "game"),
                                 Icon(text: "Cars", image: "car"),
                                 Icon(text: "Furniture", image: "bed"),
                                 Icon(text: "Kids", image: "robotic"),]
}
