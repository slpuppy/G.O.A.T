//
//  Home.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import SwiftUI

struct HomeView: View {
    
   
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
            }
            .sheet(isPresented: $presentAddNewGoatScreen) {
                AddGoatView().navigationBarTitle("Add G.O.A.T")
            }.background(Color("bgColor"))
            
            
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
