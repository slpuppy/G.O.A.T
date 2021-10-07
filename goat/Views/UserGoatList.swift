//
//  UserGoatList.swift
//  goat
//
//  Created by Gabriel Puppi on 07/10/21.
//

import SwiftUI

struct UserGoatList: View {
    
    @ObservedObject private var viewModel = GoatsViewModel()
    

    var body: some View {
        
    
       ScrollView {
           
           VStack {
               ForEach(viewModel.usersGoats) { goat in
                        
                UserGoatListRow(row: goat)
               
               }.padding([.leading, .trailing], 20)
           
              
           }
    }
    
    .onAppear() {
            
            self.viewModel.fetchUserData()
            
        }
  }
}

struct UserGoatListRow: View {
    
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



struct UserGoatList_Previews: PreviewProvider {
    static var previews: some View {
        UserGoatList()
    }
}
