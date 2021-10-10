

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            
            Image("goatApp")
                .resizable()
                .scaledToFit()
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(.bottom, 30)
                .padding(.top, 20)
                
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color("mainBlu")).opacity(0.5)
                .cornerRadius(15.0)
                .padding(.bottom, 10)
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color("mainBlu")).opacity(0.5)
                .cornerRadius(15.0)
                .padding(.bottom, 25)
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                
                viewModel.signIn(email: email, password: password)
                
            }, label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainBlu"))
                        .frame(maxHeight: 60)
                      
                    Text("Sign In").font(.system(size: 18))
                        .foregroundColor(Color("darkBlu"))
                }.padding([.leading, .trailing], 20)})
            
            Text("or")
                .foregroundColor(Color("mainBlu"))
            
            NavigationLink(destination: SignUpView(), label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainPink"))
                        .frame(maxHeight: 60)
                       
                    Text("Create an account").font(.system(size: 18))
                        .foregroundColor(Color.white)
                }.padding([.leading, .trailing], 20)
            })
            
            NavigationLink(destination: ResetPasswordView(), label:{
                
                Text("Forgot your password ? Click here")
                    .font(.system(size: 14))
                    .padding(.top, 20)
               
               .foregroundColor(Color("mainPink"))
                
                
            })
            
            
            
            Spacer()
        }.padding(20)
            .navigationBarHidden(true)
        
    }
}





struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
