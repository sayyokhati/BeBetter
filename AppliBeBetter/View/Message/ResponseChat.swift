//
//  ResponseChat.swift
//  BeBetter
//
//  Created by apprenant62 on 26/06/2023.
//

import Foundation

func getChatReponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("bonjour") {
        return "Toujours ok pour le call ?"
    } else if tempMessage.contains("oui") {
        return "Super, on a été très productif"
    } else if tempMessage.contains("bravo marc") {
        return "Félicitations Karine !"
    } else {
        return "Parfait."
    }
}
