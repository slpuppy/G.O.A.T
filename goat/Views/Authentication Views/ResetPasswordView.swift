//
//  ResetPasswordView.swift
//  goat
//
//  Created by Gabriel Puppi on 10/10/21.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State var passwordResetEmail: String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack{
            
            
            Text("Enter the email of your account")
            
            TextField("Account email", text: $passwordResetEmail)
                .padding()
                .background(Color("mainBlu")).opacity(0.5)
                .cornerRadius(15.0)
                .padding(.bottom, 10)
            
            
            Button(action:{
                
                viewModel.sendPasswordReset(withEmail: passwordResetEmail) { error in
                    
                    
                    print("EMAIL DONT EXIST")
                }
                
                
                
            }, label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainPink"))
                        .frame(maxHeight: 60)
                      
                    Text("Sign In").font(.system(size: 18))
                        .foregroundColor(Color.white)
                }.padding([.leading, .trailing], 20)})
                
                
            }
        Spacer()
            
        
        
    
    
    
    
    
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
