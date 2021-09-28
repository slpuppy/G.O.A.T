

import SwiftUI

struct SignView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            
            Image("goatApp")
                .resizable()
                .scaledToFit()
                .padding(.leading, 50)
                .padding(.trailing, 50)
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
                .padding(.bottom, 10)
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                viewModel.signIn(email: email, password: password)
                
            }, label: {
                
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(Color("mainPink"))
                        .frame(maxHeight: 60)
                        .padding()
                    Text("Sign In").font(.system(size: 18))
                        .foregroundColor(.white)
                }})
            
            NavigationLink("Create Account", destination: SignUp())
                .font(.system(size: 18))
                .foregroundColor(Color("mainBlu"))
                .padding()
            
            Spacer()
        }.padding(20)
    }
}



struct SignUp: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            
            Image("goatApp")
                .resizable()
                .scaledToFit()
                .padding(.leading, 50)
                .padding(.trailing, 50)
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
                        .foregroundColor(.white)
                }})
            
            Spacer()
        }.padding(20)
    }
}



struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
