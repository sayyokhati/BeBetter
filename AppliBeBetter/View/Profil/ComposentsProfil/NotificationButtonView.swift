//
//  NotificationButtonView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 04/07/2023.
//

import SwiftUI

struct NotificationButtonView: View {
    
    var icone: Image
    var label: String
    
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 150)
                .foregroundColor(Color("bleu"))
            VStack{
                icone
//                Image(icone)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.black)
                Text(label)
                    .font(.system(size: 18))
                .foregroundColor(Color("bleunoir"))
                
            }
        }
    }
}
        struct NotificationButtonView_Previews: PreviewProvider {
            static var previews: some View {
                NotificationButtonView(icone: Image("eau"), label: "Sport")
            }
        }

