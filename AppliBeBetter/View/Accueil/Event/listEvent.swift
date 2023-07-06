//
//  listEvent.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 30/06/2023.
//

import Foundation

struct Event : Identifiable{
    var id = UUID()
    var meeting: String
    var heureStart: String
    var heureEnd: String
    var detail: String
    
}

var Events = [
    Event(meeting: "Rendez-vous", heureStart: "11:00", heureEnd: "12:00", detail: "avec Mr Durant"),
    Event(meeting: "Réunion", heureStart: "13:00", heureEnd: "14:00", detail: "avec les Dév Web"),
    Event(meeting: "Call", heureStart: "15:00", heureEnd: "16:00", detail: "Mr Dupont"),
    Event(meeting: "Rendre dossier", heureStart: "17:00", heureEnd: "", detail: "SMHP")

]
