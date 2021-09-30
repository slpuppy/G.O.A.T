//
//  GoatList.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import SwiftUI

struct GoatList: View {
    
    @ObservedObject private var viewModel = GoatsViewModel()
    
   var body: some View {
        
    
       
            
            VStack {
                
                ForEach(viewModel.goats) { goat in
                    
                    ZStack{
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(Color("bgColor"))
                            .shadow(color: Color.black.opacity(0.1), radius: 13.0, x: 0.0, y: 4.0)
                        
                        HStack{
                            
                            
                            Text(goat.title).font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            Spacer()
                            
                            Image(systemName: "link")
                            
                            
                        }.padding()
                        
                        
                        
                        
                    }.padding()
                        
                    
                    
                    
                   
                }
            }.onAppear() {
            
            self.viewModel.fetchData()
            
        }
  }
}

struct GoatList_Previews: PreviewProvider {
    static var previews: some View {
        GoatList()
    }
}
