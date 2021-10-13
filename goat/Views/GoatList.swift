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
            
            self.viewModel.fetchPublicData()
            
        }
  }
}

struct GoatListRow: View {
    
    @StateObject var row: GoatItem
    @Environment(\.openURL) var openURL
    var body: some View {
        
       
      
        
        NavigationLink(destination: GoatItemDetailView(goatPressed: row.self)) {
        
       ZStack{
            VStack {
               HStack{
               Text(row.title)
                       .font(.system(size: 22,
                                     weight: .bold,
                                     design: .default))
                                               .foregroundColor(Color.white)
                                               .multilineTextAlignment(.leading)
                                               .padding([.bottom, .top], 10)
                                               

                   Spacer()
                   VStack{
                   Image(systemName: "link").foregroundColor(Color("mainPink"))
                       .font(.system(size: 20))
                       .onTapGesture {
                           openURL(URL(string: row.link)!)
                       }
                       
                       Text("Open").font(.footnote)
                           .foregroundColor(Color("mainPink"))
                       
                   }
                   .padding()
                   .background(Color.white)
                   .cornerRadius(15)
                  
                
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
