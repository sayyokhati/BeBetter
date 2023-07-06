//
//  LoadingScreenView.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 30/06/2023.
//

import SwiftUI

struct LoadingScreenView: View {


        @State var isActive:Bool=false
        var body: some View {
            
            VStack {
            ZStack{
                if isActive{
                    TabBarView()
                }
                else{
                    Color("bleufonce")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100,height: 100)
                        Text("BE-BETTER")
                            .bold()
                            .font(.title2)
                    }

                }
              
                }

                
            }
            .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }




    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
            .environmentObject(HealthKitViewModel())
            .environmentObject(DateHolder())
            .environmentObject(TaskViewModel())
    }
}
