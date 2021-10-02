//
//  ContentView.swift
//  growroom
//
//  Created by Gabriel Puppi on 27/09/21.
//

import SwiftUI


enum Tabs: String {
    
    case home = "Goats"
    case profile = "Profile"
    
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
   
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        
        TabView(selection: $selectedTab){
                HomeView()
                    .tabItem{
                        Image(systemName: "house.fill")
                     
                    }
                    .tag(Tabs.home)
                
                ConfigView()
                    .tabItem{
                        
                        Image(systemName: "gearshape")
                           
                        
                    }
                    .tag(Tabs.profile)
                
            }
        
       .navigationTitle(selectedTab.rawValue)
           .navigationBarTitleDisplayMode(.large)
           .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color("mainPink"))
            .background(Color("bgColor"))
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
