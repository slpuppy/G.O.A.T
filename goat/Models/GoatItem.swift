//
//  GoatItem.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestoreSwift


class GoatItem: Codable, JSONRepresentable, ObservableObject, Identifiable {
    
    
    
    internal init(title: String, link: String, comments: [String]) {
        self.title = title
        self.link = link
        self.comments = comments
    }
    
    
     
    @DocumentID var docID: String? 
     var title: String
     var link: String
     var comments: [String]?
     //var id = UUID()


    enum CodingKeys: String, CodingKey {
        
        case title
        case link
       // case id
        case docID
        case comments
    }






}

