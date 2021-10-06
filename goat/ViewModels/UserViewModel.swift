//
//  UserViewModel.swift
//  goat
//
//  Created by Gabriel Puppi on 06/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth




class UserViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    private var auth = Auth.auth()
    private var dataBase = Firestore.firestore()
    
    
    func fetchUserData() {
        
       dataBase.collection("users").addSnapshotListener { (querySnapshot, error) in
                
                guard let documents = querySnapshot?.documents else {
                    print("No users")
                    return
               }
                
                
                
                self.users =  documents.compactMap { (queryDocumentSnapshot) -> User? in
                    
                   return try? queryDocumentSnapshot.data(as: User.self)
                    
               }
                
            }
        }
    
    private func addUserGoat(goat: GoatItem) {
         do {
             
             let newDocRef = dataBase.collection("users").document(auth.currentUser!.uid)
             
             try? newDocRef.collection("usergoats").parent?.setData(from: goat)
             
          } catch {
             print(error)
         }
     }
    
    
}

