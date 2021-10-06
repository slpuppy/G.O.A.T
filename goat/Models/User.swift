//
//  User.swift
//  goat
//
//  Created by Gabriel Puppi on 06/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class User: Identifiable, Codable, ObservableObject {
    
    internal init(name: String?, userID: String, email: String, goats: [GoatItem]) {
        self.name = name
        self.userID = userID
        self.email = email
        self.goats = goats
    }
    
    let name: String?
    @DocumentID var userID: String?
    let email: String
    var goats: [GoatItem?]
    
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case userID
        case email
        case goats
        
        
    }
    
    
    
 
}


