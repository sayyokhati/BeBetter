//
//  ContactView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct ContactView: View {
    
    let contact: Contacts
    

    var body: some View {
        VStack {
            Image(contact.contactImage)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 240, height: 240)
            Text(contact.contactName)
                .font(.system(size: 40))
                .bold()
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: allContacts[0])
    }
}
