//
//  GoatItemViewModel.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import UIKit


class GoatItemViewModel: ObservableObject {
    
    
    @Published var goat: GoatItem = GoatItem(title: "", link: "", comments: [""])
    
    
    private var dataBase = Firestore.firestore()
    
    private var auth = Auth.auth()
    
    
   private func addGoat(goat: GoatItem) {
        do {
           let _  = try dataBase.collection("goats").addDocument(from: goat)
        } catch {
            print(error)
        }
    }
    
    
    private func addUserGoat(goat: GoatItem) {
         
        do {
           
            let docRef = dataBase.collection("users").document(auth.currentUser!.uid)
            
            try docRef.collection("usergoats").addDocument(from: goat)
            
         } catch {
             print(error)
         }
     }
    
    
   func save() {
        updateOrAddGoat()}
    
    func saveUserGoat() {
        
        addUserGoat(goat: goat)
        
    }
    
    
    private func updateGoatInfo(_ goat: GoatItem) {
        
        if let documentId = goat.docID {
            do {
                try dataBase.collection("goats").document(documentId).setData(from: goat) 
            } catch {
                print(error)
                
            }
        }
    }
    
    private func updateOrAddGoat() {
        
        if let _ = goat.docID {
            
            self.updateGoatInfo(self.goat)
            
        }
        else {
            
            addGoat(goat: goat)
            
        }
        
        
    }
    
    
    
    
   
    
    
    
    func removeGoat(id: String?) {
        if let documentId = id {
            print(documentId)
            dataBase.collection("goats").document(documentId).delete() { error in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                
            }
            
        }
       
       
       
     }
    
    

    



}
