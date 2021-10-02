//
//  LaunchView.swift
//  goat
//
//  Created by Gabriel Puppi on 02/10/21.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView{
         
        if viewModel.isSignedIn {
            
            ContentView()
            
        } else {
            
            SignInView()
            
        }
        
        }.onAppear{
            viewModel.signedIn = viewModel.isSignedIn
    }
  }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
