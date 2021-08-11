//
//  Item.swift
//  DoMore
//
//  Created by Nuriddin Musojonov on 10/08/21.
//

import Foundation
class Item{
    var txt:String? = ""
    var image:String? = ""
    
    init(txt:String,image:String) {
        self.image = image
        self.txt = txt
    }
}
