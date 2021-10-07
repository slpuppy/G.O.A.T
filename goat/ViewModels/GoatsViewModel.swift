//
//  GoatViewModel.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth



class GoatsViewModel: ObservableObject {
    
    
    @Published var goats = [GoatItem]()
    
    @Published var usersGoats = [GoatItem]()
    
    
    private var auth = Auth.auth()
    private var dataBase = Firestore.firestore()
    
    
    func fetchPublicData() {
        
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
    
    func fetchUserData() {
        
        let userRef = dataBase.collection("users").document(auth.currentUser!.uid)
        
        userRef.collection("usergoats").addSnapshotListener { (querySnapshot, error) in
                
                guard let documents = querySnapshot?.documents else {
                    print("No usergoats")
                    return
               }
                
               self.usersGoats =  documents.compactMap { (queryDocumentSnapshot) -> GoatItem? in
                    
                   return try? queryDocumentSnapshot.data(as: GoatItem.self)
                    
               }
                
            }
        }
    
    
}
