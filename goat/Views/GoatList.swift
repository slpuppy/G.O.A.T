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
                    
            GoatListRow(row: goat)
                
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
                .cornerRadius(15)
                .foregroundColor(Color("bgColor"))
                .shadow(color: Color.black.opacity(0.1), radius: 13.0, x: 0.0, y: 4.0)
            
            HStack{
                Text(row.title).font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(Color("darkBlu"))
                
                    
                Spacer()
                Image(systemName: "link").foregroundColor(Color("mainPink"))
            
            }.padding(15)
       }
        
        }
    }
    
    
}

    
struct GoatList_Previews: PreviewProvider {
    static var previews: some View {
        GoatList()
    }
}
