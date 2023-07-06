//
//  Profile struct.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 22/06/2023.
//

import Foundation
import SwiftUI

class Profile: Identifiable, ObservableObject{
    internal init(myName: String, myLastName: String, myJob: String, ageJob: Int, myPicture: String, myMail: String) {
        self.id = UUID()
        self.myName = myName
        self.myLastName = myLastName
        self.myJob = myJob
        self.ageJob = ageJob
        self.myPicture = myPicture
        self.myMail = myMail
    }
    
    var id = UUID()
    
   @Published var myName : String
   @Published var myLastName : String
    var fullName : String{
        return myName + " " + myLastName
    }
    @Published var myJob : String
    @Published var ageJob : Int
    @Published var myPicture : String
    @Published var myMail : String
}

var profiles = [
    Profile(myName: "Karine", myLastName: "Smith", myJob: "Cadre Sup", ageJob: 3, myPicture: "Karine", myMail: "karine.smith@gmail.com")

]




