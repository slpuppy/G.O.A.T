//
//  UserGoatList.swift
//  goat
//
//  Created by Gabriel Puppi on 07/10/21.
//

import SwiftUI

struct UserGoatList: View {
    
    @StateObject private var viewModel = GoatsViewModel()
    

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
    @Environment(\.openURL) var openURL
    
        var body: some View {
            
           
          
            
            NavigationLink(destination: UserGoatItemDetailView(goatPressed: row.self)) {
            
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
                          Text("Open").font(.footnote)
                               .foregroundColor(Color("mainPink"))
                           
                       }
                       .padding()
                       .background(Color.white)
                       .cornerRadius(15)
                       .onTapGesture {
                           openURL(URL(string: row.link)!)
                       }
                      
                    
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
