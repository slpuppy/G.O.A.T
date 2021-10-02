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
            
            HStack {
                Text(goatPressed.title)
                    .font(.system(size: 23, weight: .bold, design: .default))
                .foregroundColor(Color("textColor"))
                
               
            }
            
            Spacer()
            
            Button(action: {
             
                handleDeletePressed(id: goatPressed.docID)
                
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
        }.padding()
        
       
        
        
        
        
    }
    
    
    func handleDeletePressed(id: String?){
        
        
        self.viewModel.removeGoat(id: id)
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
