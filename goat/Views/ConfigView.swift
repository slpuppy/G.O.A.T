//
//  ConfigView.swift
//  goat
//
//  Created by Gabriel Puppi on 02/10/21.
//

import SwiftUI
import FirebaseAuth

struct ConfigView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentaionMode
    private var auth = Auth.auth()
    @State var isAddGoatPresented = false
    
   
    
    var body: some View {
       
        VStack{
            
            UserGoatList()
            
           Button(action: {
                    isAddGoatPresented.toggle()
                }, label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(Color("mainPink"))
                            .frame(maxHeight: 60)
                            .padding()
                        
                        HStack{
                            Image(systemName: "plus.circle").foregroundColor(Color("darkBlu"))
                            Text("Add personal Goat").foregroundColor(Color("darkBlu"))
                                .foregroundColor(.white)
                        }
                    }
                })
            
            Button(action: {
            
            viewModel.signOut()
            
        }, label: {
            
            ZStack{
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(Color("mainPink"))
                    .frame(maxHeight: 60)
                    .padding()
                Text("Sign Out").font(.system(size: 18))
                    .foregroundColor(.white)
                
            }
            
        })
            }
            .sheet(isPresented: $isAddGoatPresented) {
                AddGoatView(mode: .personalGoat).navigationBarTitle("Add new G.O.A.T")
            }.background(Color("bgColor"))
            
            
            
            
            
   
    
        }
    
    
    }


struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
