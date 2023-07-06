//
//  ListContactView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct ListContactView: View {
        
    @ObservedObject var myListOfContactVM: ContactDetailVM
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(myListOfContactVM.allContacts) {choosenContact in
                            ContactCellView(contact: choosenContact)
                    }
                }
            }
        }
    }
}

struct ListContactView_Previews: PreviewProvider {
    static var previews: some View {
//        ListOfRecipesView(myListOfRecipesVM: ListOfRecipesVM(arrayOfRecipes: []))
        ListContactView(myListOfContactVM: ContactDetailVM(allContacts: allContacts))
    }
}

struct ContactCellView: View {
    
    let contact: Contacts

    var body: some View {
        HStack{
            Image(contact.contactImage) .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(contact.contactName)
                    .font(.title2)
            }
        }
    }
}
