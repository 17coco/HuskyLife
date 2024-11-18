//
//  Contact.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import Foundation
import FirebaseFirestore

struct Contact: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var phone: Int
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}
