//
//  GoatItem.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestoreSwift


class GoatItem: Codable, JSONRepresentable, ObservableObject, Identifiable {
    
    
    
    internal init(title: String, link: String) {
        self.title = title
        self.link = link
    }
    
    
     
    @DocumentID var docID: String? = UUID().uuidString
     var title: String
     var link: String
     //var id = UUID()


    enum CodingKeys: String, CodingKey {
        
        case title
        case link
       // case id
        case docID
        
    }






}

