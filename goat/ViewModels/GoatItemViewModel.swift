//
//  GoatItemViewModel.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestore
import UIKit


class GoatItemViewModel: ObservableObject {
    
    
    @Published var goat: GoatItem = GoatItem(title: "", link: "", comments: [""])
    
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
    
    
    
    
    
    func removeGoat(goat: GoatItem) {
        if let documentId = goat.docID {
            print(documentId)
            dataBase.collection("goats").document(documentId).delete() { error in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                
            }
            
        }
       
       
       
     }
    
    

    



}
