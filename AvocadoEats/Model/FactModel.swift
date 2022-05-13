//
//  FactModel.swift
//  AvocadoEats
//
//  Created by adam janusewski on 5/12/22.
//

import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
