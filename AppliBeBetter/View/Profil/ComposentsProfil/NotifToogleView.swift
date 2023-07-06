//
//  NotifToogleView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 04/07/2023.
//

import SwiftUI

struct NotifToogleView: View {
    var texte: String
    @State private var notificationToggle = false
    @State private var showAlert = false
        @State private var isToggleOn = false

    var body: some View {

        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 347, height: 50)
                    .foregroundColor(Color("bleu"))
                    .opacity(0.25)
                HStack {
                   
                 
//                    Toggle("", isOn: $notificationToggle)
//                        .padding(.leading, 28)
//                        .padding(.trailing, 28)
//                        .tint(Color("bleu"))
                    Toggle(isOn: $isToggleOn) {
                        Text(texte)
                            .frame(width: 209)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                           
                            .foregroundColor(Color("bleunoir"))
                            .padding(.leading)
                                        }
                                        .padding(.leading, 28)
                                        .padding(.trailing, 28)
                                        .tint(Color("bleu"))
                                        .onChange(of: isToggleOn) { newValue in
                                            showAlert = newValue

                                        }

                                    }


                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text(""), message: Text("Vous avez activé les notifications"), dismissButton: .default(Text("OK")))
                                        //                            .tint(Color("bleu"))

                                    }
                }
            }
                }
            }
        

struct NotifToogleView_Previews: PreviewProvider {
    static var previews: some View {
        NotifToogleView(texte: "Activer/Désactiver")
    }
}
