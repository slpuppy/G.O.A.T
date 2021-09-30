//
//  GoatItemViewModel.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestore


class GoatItemViewModel: ObservableObject {
    
    
    @Published var goat: GoatItem = GoatItem(title: "", link: "")
    
    private var dataBase = Firestore.firestore()
    
    
    func addGoat(goat: GoatItem) {
        
        do {
           
            let _  = try dataBase.collection("goats").addDocument(from: goat)
        
        } catch {
            
            print(error)
            
        }
    }
    
    
    func save() {
        
        addGoat(goat: goat)
        
        
        
    }
    
    
}
