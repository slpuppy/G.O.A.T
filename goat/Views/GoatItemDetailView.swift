//
//  GoatItemDetailView.swift
//  goat
//
//  Created by Gabriel Puppi on 30/09/21.
//

import SwiftUI

struct GoatItemDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var goatPressed: GoatItem
    
    @StateObject var viewModel = GoatItemViewModel()
    
    
    var body: some View {
       
        VStack{
            
            
            Text(goatPressed.title)
            
            Button(action: {
             
               handleDeletePressed()
                
            }, label: {
                
                
                ZStack {
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainPink"))
                        .frame(maxHeight: 60)
                        .padding()
                    
                    HStack{
                        
                        Image(systemName: "trash").foregroundColor(Color("darkBlu"))
                        
                        Text("Delete G.O.A.T").foregroundColor(Color("darkBlu"))
                    }
                }
                
                
            })
        }
        
       
        
        
        
        
    }
    
    
    func handleDeletePressed(){
        
        self.viewModel.removeGoat(goat: goatPressed)
        dismiss()
        
        
    }
    
    func dismiss() {
        
        
        self.presentationMode.wrappedValue.dismiss()
        
    }
    
}

//struct GoatItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoatItemDetailView()
//    }
//}
