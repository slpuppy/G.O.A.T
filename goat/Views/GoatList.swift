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
               
               }
           
              
           }
    }.padding()
    
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
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("mainPink"))
                .shadow(color: Color.black.opacity(0.1), radius: 13.0, x: 0.0, y: 4.0)
            
           VStack(alignment: .leading) {
              
               Image("minigoat")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 35)
                    
               HStack{
               Text(row.title).font(.system(size: 22, weight: .semibold, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .bottom], 40)
                        
                       
                    
                        
                    Spacer()
                    Image(systemName: "link.circle.fill").foregroundColor(Color.white).font(.system(size: 30))
               }
            }
            padding()
           }
       }
                .padding([.top, .bottom], 5)
                
        
        }
    }
    
    


    
struct GoatList_Previews: PreviewProvider {
    static var previews: some View {
        GoatList()
    }
}
