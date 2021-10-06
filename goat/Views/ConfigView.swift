//
//  ConfigView.swift
//  goat
//
//  Created by Gabriel Puppi on 02/10/21.
//

import SwiftUI
import FirebaseAuth

struct ConfigView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    private var auth = Auth.auth()
    
    @ObservedObject private var vM = UserViewModel()
    
    var body: some View {
       
        VStack{
            
            
        
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
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
