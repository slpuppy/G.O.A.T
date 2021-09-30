//
//  Home.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var presentAddNewGoatScreen = false
    
    
    var body: some View {
        
        
        VStack{
            
           GoatList()
            
            Button(action: {
                presentAddNewGoatScreen.toggle()
                
            }, label: {
                
                
                ZStack {
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainPink"))
                        .frame(maxHeight: 60)
                        .padding()
                    
                    HStack{
                        
                        Image(systemName: "plus").foregroundColor(Color("darkBlu"))
                        
                        Text("Add Goat").foregroundColor(Color("darkBlu"))
                    }
                }
                
                
            })
            
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
            
        }.sheet(isPresented: $presentAddNewGoatScreen) {
            
            AddGoatView().navigationBarTitle("Add G.O.A.T")
            
        }
     }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
