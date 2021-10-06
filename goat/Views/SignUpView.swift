//
//  SignUpView.swift
//  goat
//
//  Created by Gabriel Puppi on 29/09/21.
//

import SwiftUI


struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            
            Color("bgColor").edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("goatApp")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.bottom, 30)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color("mainBlu")).opacity(0.5)
                    .cornerRadius(15.0)
                    .padding(.bottom, 10)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("mainBlu")).opacity(0.5)
                    .cornerRadius(15.0)
                    .padding(.bottom, 10)
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: email, password: password)
                    
                }, label: {
                    
                    ZStack{
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(Color("mainPink"))
                            .frame(maxHeight: 60)
                            .padding()
                        Text("Create Account").font(.system(size: 18))
                            .foregroundColor(Color("darkBlu"))
                    }})
                
              Spacer()
                
            }.padding(20)
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
