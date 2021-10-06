//
//  GoatViewModel.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift




class GoatsViewModel: ObservableObject {
    
    
    @Published var goats = [GoatItem]()
    
    private var dataBase = Firestore.firestore()
    
    
    func fetchData() {
        
        dataBase.collection("goats").addSnapshotListener { (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
           }
            
            self.goats =  documents.compactMap { (queryDocumentSnapshot) -> GoatItem? in
                
               return try? queryDocumentSnapshot.data(as: GoatItem.self)
                
           }
            
        }
        
        
    }
    
  
    
    
    
}
