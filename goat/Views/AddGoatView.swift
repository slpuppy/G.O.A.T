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
            
            Text("Add New G.O.A.T").font(.headline)
                .padding(.bottom, 30)
                
            
            
            HStack{
                Text("What is the G.O.A.T ?").font(.system(size: 23, weight: .bold, design: .default))
                    .foregroundColor(Color("textColor"))
                Spacer()
            }
        
            TextField("Goat Title", text: $viewModel.goat.title)
            .padding()
            .background(Color("mainBlu")).opacity(0.5)
            .cornerRadius(15.0)
           
            
            HStack{
                Text("What is the link to it ?").font(.system(size: 23, weight: .bold, design: .default))
                    .foregroundColor(Color("textColor"))
                Spacer()
            }.padding(.top, 30)
        
            TextField("Goat access link", text: $viewModel.goat.link)
            .padding()
            .background(Color("mainBlu")).opacity(0.5)
            .cornerRadius(15.0)
            
        Button(action: {
            
            handleSaveTapped()
            
        }, label: {
           ZStack{
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(Color("mainPink"))
                    .frame(maxHeight: 60)
                    
                Text("Save G.O.A.T").font(.system(size: 18))
                    .foregroundColor(.white)
             }
        }).padding(.top, 50)
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
