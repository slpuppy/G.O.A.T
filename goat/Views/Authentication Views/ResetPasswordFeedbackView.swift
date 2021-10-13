//
//  ResetFeedbackView.swift
//  goat
//
//  Created by Gabriel Puppi on 10/10/21.
//

import SwiftUI

struct ResetFeedbackView: View {
    var body: some View {
        
        VStack{
        
        Image("mailGoat")
            .resizable()
            .scaledToFit()
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.bottom, 30)
            .padding(.top, 20)
            
            
        
        Text("An email has been sent to you")
            .font(.system(size: 22,
                          weight: .bold,
                          design: .default))
            .foregroundColor(Color("mainPink"))
            .padding()
        
        NavigationLink(destination: SignInView(), label: {
            
            ZStack{
                Rectangle()
                    .cornerRadius(15)
                    .foregroundColor(Color("mainPink"))
                    .frame(maxHeight: 60)
                  
                Text("Back to login").font(.system(size: 18))
                    .foregroundColor(Color.white)
            
            }.padding([.leading, .trailing], 20)})
        
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Email Sent")
            
        }
    }


struct ResetFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        ResetFeedbackView()
    }
}
