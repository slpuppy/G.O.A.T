//
//  SignAuthService.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class AuthViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
        
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                
                //Sucess
                self?.signedIn = true
            }
            
            
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                
                //Sucess
                print("Sucess")
                self?.signedIn = true
                
                let db = Firestore.firestore()
                let uid = result!.user.uid
                
                db.collection("users").document(uid).setData( ["email": email, "uid": uid]) { (error) in
                    
                    if  error != nil {
                        
                       print("Error saving user data")
                        
                    }
                    
                    
                    
                }
            }
        }
    }
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    
    
    func deleteAccount() {
        
        let user = auth.currentUser
        
        user?.delete { error in
          if let error = error {
            // An error happened.
              print(error)
              
          } else {
              self.signOut()
              print("sucessfull deleted")
          }
        }
        
    }
 
    
    
    func signOut() {
        
        try? auth.signOut()
        
        self.signedIn = false
        
    }
}




