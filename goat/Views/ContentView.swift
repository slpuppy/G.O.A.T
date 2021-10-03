//
//  ContentView.swift
//  growroom
//
//  Created by Gabriel Puppi on 27/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView{
            
            ZStack{

                Color("bgColor").edgesIgnoringSafeArea(.all)
                
                if viewModel.isSignedIn {

                    TabView{
                        
                        HomeView()
                            .tabItem{
                                
                                Image(systemName: "house")
                                
                            }
                        
                        ProfileView()
                            .tabItem{
                                Image(systemName: "person.crop.circle")
                                
                            }
                        

                    }.accentColor(Color("mainPink"))
                }

                else {

                    SignInView()

                }
                
                
                
            }
            
           
            
            
            
            
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
