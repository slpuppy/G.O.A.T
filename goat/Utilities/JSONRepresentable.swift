//
//  JSONRepresentable.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation



extension JSONRepresentable where Self: Encodable, Self: Decodable {
    
    func asJson() throws -> [String: Any] {
        
        let encoded = try JSONEncoder().encode(self)
        let decoded = try JSONSerialization.jsonObject(with: encoded, options: [])
        return decoded as! [String: Any]
        
        
    }
}


protocol JSONRepresentable {
    
    
    
    
    
}






