//
//  ConfigView.swift
//  goat
//
//  Created by Gabriel Puppi on 07/10/21.
//

import SwiftUI
import FirebaseAuth



struct ConfigView: View {
   
    @EnvironmentObject var viewModel: AuthViewModel
    private var auth = Auth.auth()
    
    @State var isDeletePresented = false
    @State var isSignOutPresented = false
    
    var body: some View {
        
        
        VStack{
        List{
            
            Button(action: {
                isSignOutPresented.toggle()
        }, label: {
           Text("Sign Out").font(.system(size: 18))
                .foregroundColor(Color.gray).opacity(0.6)
           }).actionSheet(isPresented: $isSignOutPresented, content: {
               
               ActionSheet(title: Text("Are you sure you want to sign out?"),
                           buttons: [
                               
                               
                               .default(Text("Cancel")) {
                                   
                                  isSignOutPresented.toggle()
                                   
                               },
                               
                               Alert.Button
                               
                                   .destructive(Text("Sign Out")) {
                                       
                                       self.viewModel.signOut()
                                   }
                           ])
           })
            
            Button(action: {
                isDeletePresented.toggle()
        }, label: {
           Text("Delete account").font(.system(size: 18))
                .foregroundColor(Color.gray).opacity(0.6)
           }).actionSheet(isPresented: $isDeletePresented, content: {
               
               ActionSheet(title: Text("Are you sure you want to delete your account?"),
                           buttons: [
                               
                               
                               .default(Text("Cancel")) {
                                   
                                   isDeletePresented.toggle()
                                   
                               },
                               
                               Alert.Button
                               
                                   .destructive(Text("Delete")) {
                                       
                                       self.viewModel.deleteAccount()
                                   }
                           ])
           })
            
        }
    }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
