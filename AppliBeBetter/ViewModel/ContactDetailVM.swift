//
//  ContactDetailVM.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 29/06/2023.
//

import Foundation




class ContactDetailVM : ObservableObject {
    
    
    internal init(allContacts: [Contacts]) {
        self.allContacts = allContacts
    }
    
    @Published var allContacts : [Contacts]
    
    func addContactToTheList(newContact: Contacts) {
        self.allContacts.append(newContact)
    }
    
    
}

var arrayOfRecipesOfAdeline : ContactDetailVM = ContactDetailVM(allContacts: allContacts)
