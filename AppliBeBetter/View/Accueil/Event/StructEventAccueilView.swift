//
//  DetailsEventAccueilView.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 30/06/2023.
//

import SwiftUI

struct StructEventAccueilView: View {
    
    var meeting = "Rendez-vous"
    var heureStart = "13:00"
    var heurEnd = "14:00"
    var detail = "avec Mr Durant"
    
    var body: some View {
        HStack {
            
                
                
                HStack(spacing:32) {
//                    Spacer()
                    Image("calendrier")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
//                    Spacer()
                    VStack(alignment:.leading) {
                        HStack {
                            Text(heureStart)
                            Text(heurEnd)
                            Text(meeting)
                                .foregroundColor(Color("bleufonce"))
                                .font(.title3)
                            
                        }
                        HStack {
                            
                            Text(detail)
                            
                        }
                        .font(.title3)
                        
                    }
                    Spacer()
                    
                    
                    
                    
                    
                }
                .padding()
                .foregroundColor(.black)
                .frame(width: 350,height: 60)
//                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("bleu"))
                )
            
        }    }
}

struct StructEventAccueilView_Previews: PreviewProvider {
    static var previews: some View {
        StructEventAccueilView()
    }
}
