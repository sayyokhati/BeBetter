//
//  DaySwitcherView.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 29/06/2023.
//

import SwiftUI

struct DaySwitcherView: View {
    @Binding var day : String
    
    var body: some View {
        
        
            HStack {
                Button {
                    if day == "Demain" {
                        day = "Aujourd'hui"
                    }
                    else {
                        day = "Hier"
                    }
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(.trailing, 50)
                    
                }
                Text(day)
                    .font(.title)
                    .frame(width:200)
                    .fontWeight(.semibold)
                    .font(.system(size: 25))
                    .foregroundColor(Color("bleunoir"))

                
                Button {
                    if day == "Hier" {
                        day = "Aujourd'hui"
                        
                    }
                    else {
                        day = "Demain"
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .padding(.leading, 50)

                       
                }
            
            
        }

       
        
    }
}

struct DaySwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        DaySwitcherView(day: .constant("Aujourd'hui"))
    }
}
