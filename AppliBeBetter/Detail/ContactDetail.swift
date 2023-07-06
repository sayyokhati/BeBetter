//
//  ContactDetail.swift
//  BeBetter
//
//  Created by apprenant62 on 19/06/2023.
//

import Foundation

enum Status: String {
    case online = "En ligne"
    case offline = "Hors ligne"
}

enum Group: String {
    case TeamDev = "Team Dev"
    case TeamRH = "Team RH"
    case TeamManager = "Team Manager"
}

struct Contacts: Identifiable {
    var id: UUID = UUID()
    var contactName: String
    var contactImage: String
    var contactStatus: Status
    var isCurrentUser: Bool = false
    var contactGroup: Group
}

struct Message {
    var content: String
    var contacts: Contacts
}

var Marc: Contacts = Contacts(contactName: "Marc", contactImage: "Marc", contactStatus: .online, contactGroup: .TeamDev)
var Lucie: Contacts = Contacts(contactName: "Lucie", contactImage: "Lucie", contactStatus: .offline, contactGroup: .TeamDev)
var Pierre: Contacts = Contacts(contactName: "Pierre", contactImage: "Pierre", contactStatus: .offline, contactGroup: .TeamManager)
var Alex: Contacts = Contacts(contactName: "Alex", contactImage: "Alex", contactStatus: .online, contactGroup: .TeamDev)
var Eugenie: Contacts = Contacts(contactName: "Eugenie", contactImage: "Eugenie", contactStatus: .offline, contactGroup: .TeamManager)
var Ibrahim: Contacts = Contacts(contactName: "Ibrahim", contactImage: "Ibrahim", contactStatus: .online, contactGroup: .TeamDev)

let allContacts : [Contacts] = [Marc, Lucie, Pierre, Alex, Eugenie, Ibrahim]

let tabOfTeamDev : [Contacts] = [Marc, Lucie, Alex, Ibrahim]
let tabOfTeamManager : [Contacts] = [Pierre, Eugenie]
