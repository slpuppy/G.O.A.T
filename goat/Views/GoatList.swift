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
        
    
       ScrollView {
           
           VStack {
               ForEach(viewModel.goats) { goat in
                        
                GoatListRow(row: goat)
               
               }.padding([.leading, .trailing], 20)
           
              
           }
    }
    
    .onAppear() {
            
            self.viewModel.fetchData()
            
        }
  }
}

struct GoatListRow: View {
    
    @StateObject var row: GoatItem
    
    var body: some View {
        
        NavigationLink(destination: GoatItemDetailView(goatPressed: row.self)) {
        
       ZStack{
            VStack {
               HStack{
               Text(row.title)
                       .font(.system(size: 24,
                                     weight: .bold,
                                     design: .default))
                                               .foregroundColor(Color.white)
                                               .multilineTextAlignment(.leading)
                                               .padding([.top, .bottom], 40)

                   Spacer()
                   Image(systemName: "link").foregroundColor(Color.white)
                       .font(.system(size: 20))
                
               }
               
           }.padding()
       }
        .background(Color("mainPink"))
        
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.1), radius: 13, x: 0, y: 4)
        .padding([.top, .bottom], 10)
        
        
        }
    }
    
    
}
    


    
struct GoatList_Previews: PreviewProvider {
    static var previews: some View {
        GoatList()
    }
}
