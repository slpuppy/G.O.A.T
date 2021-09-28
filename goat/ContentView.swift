//
//  ContentView.swift
//  growroom
//
//  Created by Gabriel Puppi on 27/09/21.
//

import SwiftUI
import FirebaseAuth


class AppViewModel: ObservableObject {
    
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
                self?.signedIn = true
            }
        }
    }
    
    
    func signOut() {
        
        try? auth.signOut()
        
        self.signedIn = false
        
    }
    
    
    
    
    
    
    
}


struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView{
            
            if viewModel.isSignedIn {
                
                VStack{
                    Text("You're signed in")
                    
                    Button(action: {
                        
                        viewModel.signOut()
                        
                    }, label: {
                        
                        ZStack{
                            Rectangle()
                                .cornerRadius(15)
                                .foregroundColor(Color("mainPink"))
                                .frame(maxHeight: 60)
                                .padding()
                            Text("Sign Out").font(.system(size: 18))
                                .foregroundColor(.white)
                            
                        }
                        
                    })
                    
                }
            }
            else {
                SignView()
            }
            
            
            
        }.onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
        
        
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
