//
//  AddGoatView.swift
//  goat
//
//  Created by Gabriel Puppi on 30/09/21.
//

import SwiftUI

struct AddGoatView: View {
    
 @Environment(\.presentationMode) var presentationMode
 
 @StateObject var viewModel = GoatItemViewModel()
    
    
    var body: some View {
        
        
        VStack{
        
            TextField("Goat Title", text: $viewModel.goat.title)
            .padding()
            .background(Color("mainBlu")).opacity(0.5)
            .cornerRadius(15.0)
            .padding(.bottom, 10)
        
            TextField("Goat access link", text: $viewModel.goat.link)
            .padding()
            .background(Color("mainBlu")).opacity(0.5)
            .cornerRadius(15.0)
            .padding(.bottom, 10)
        
        
        
        Button(action: {
            
            handleSaveTapped()
            
        }, label: {
           ZStack{
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(Color("mainPink"))
                    .frame(maxHeight: 60)
                    .padding()
                Text("Save G.O.A.T").font(.system(size: 18))
                    .foregroundColor(.white)
               
               
}
            
        })
            Spacer()
        }.padding()
            .navigationBarTitle("Add G.O.A.T")
    
    }

    func handleSaveTapped() {
        
        viewModel.save()
        dismiss()
   }

    func dismiss() {
        
        presentationMode.wrappedValue.dismiss()
        
    }

}







struct AddGoatView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoatView()
    }
}
