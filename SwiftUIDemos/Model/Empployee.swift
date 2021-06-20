//
//  Empployee.swift
//  SwiftUIDemos
//
//  Created by mukesh on 29/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

struct Employee:Identifiable{
    var name: String
    var location: String
    var id = UUID()
}

class Model: ObservableObject{
    
    @Published var employees: [Employee] = []
    
    func loadEmployess(){
        employees = [
            .init(name: "mukesh lokare", location: "pune"),
            .init(name: "Shivanshu", location: "delhi")
        ]
    }
}
