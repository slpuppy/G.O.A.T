//
//  UserGoatItemDetailView.swift
//  goat
//
//  Created by Gabriel Puppi on 07/10/21.
//

import SwiftUI

struct UserGoatItemDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.openURL) var openURL
    
    @StateObject var goatPressed: GoatItem
    
    @State var makePublic = false
    
    @State private var presentAddNewGoatScreen = false
    
    @State private var showingOptions = false
    
    @StateObject var viewModel = GoatItemViewModel()
    
    var body: some View {
       
        VStack{
            
            HStack{
                Text(goatPressed.title)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(Color("mainPink"))
                
                
            }
            
            
            Image("whitegoat")
                .resizable()
                .scaledToFit()
                .padding([.leading, .trailing], 40)
            
            
            
            HStack{
                Image(systemName: "link")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundColor(Color("mainPink"))
                Text("Acess link:")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .foregroundColor(Color("textColor"))
            }.padding(.bottom, 10)
            
            
            HStack{
                Text(goatPressed.link)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .padding([.leading, .trailing], 30)
                    .padding([.top,.bottom], 10)
                    .multilineTextAlignment(.center)
                
                
                Button(action: {
                    
                    presentAddNewGoatScreen.toggle()
                    viewModel.updateGoat(id: goatPressed.docID)
                    
                    
                }, label: {
                    
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 15)
                        .padding([.top,.bottom], 5)
               })
           }
            .background(Color("mainPink"))
            .cornerRadius(50)
            .padding([.top,.bottom], 5)
            .shadow(color: Color.black.opacity(0.1), radius: 13, x: 0, y: 4)
            .padding([.leading, .trailing], 20)
            .onTapGesture {
                openURL(URL(string: goatPressed.link)!)
            }
            
            
          
            
            
            
            Button("Not a Goat anymore? Click here to delete."){
                
                showingOptions.toggle()
                
            } .font(.system(size: 13, weight: .regular, design: .default))
                .foregroundColor(Color("strongPink"))
                .padding(.top, 30)
                .actionSheet(isPresented: $showingOptions, content: {
                    
                    ActionSheet(title: Text("Are you sure you want to delete this goat?"),
                                buttons: [
                                    
                                    
                                    .default(Text("Cancel")) {
                                        
                                        showingOptions.toggle()
                                        
                                    },
                                    
                                    Alert.Button
                                    
                                        .destructive(Text("Delete")) {
                                            
                                            self.viewModel.removeUserGoat(id: goatPressed.docID)
                                        }
                                ])
                })
            Spacer()
            
        }
        .sheet(isPresented: $presentAddNewGoatScreen) {
            AddGoatView(mode: .editPersonalGoat).navigationBarTitle("Add G.O.A.T")
        }.background(Color("bgColor"))
           
        
        
        
    }
}

//struct UserGoatItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserGoatItemDetailView()
//    }
//}
