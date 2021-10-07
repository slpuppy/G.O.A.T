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
                            Image(systemName: "plus.circle").foregroundColor(Color("darkBlu"))
                            Text("Add new Goat").foregroundColor(Color("darkBlu"))
                                .foregroundColor(.white)
                        }
                    }
                })
            }
            .sheet(isPresented: $presentAddNewGoatScreen) {
                AddGoatView(mode: .publicGoat).navigationBarTitle("Add new G.O.A.T")
            }.background(Color("bgColor"))
            
            
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
