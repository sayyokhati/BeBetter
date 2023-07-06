//
//  ProfileToogleView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 22/06/2023.
//

import SwiftUI

struct ProfileToogleView: View {
    
    var texte: String
    @State private var notificationToggle = false

    var body: some View {
        HStack {
            Text(texte)
                .font(.system(size: 20))
                .foregroundColor(Color("bleunoir"))
                .padding(.leading)
            Spacer()
            Toggle("", isOn: $notificationToggle)
                .padding(.leading, 28)
                .padding(.trailing, 28)
                .tint(Color("bleu"))
        }
        .padding(.leading, 20)
//        .background(.white)
//        .frame(width: 342, height: 32)
//        .cornerRadius(20)
//        .overlay(RoundedRectangle(cornerRadius: 10)
//            .stroke(lineWidth: 2)
//            .foregroundColor(Color("bleufonce"))
//        )
    }
}


