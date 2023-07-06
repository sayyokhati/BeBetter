//
//  listeaccuiel.swift
//  AppliBeBetter
//
//  Created by Sharik Mohamed on 01/07/2023.
//




import Foundation

struct Listeacceuil :    Identifiable {
    var id = UUID()
    var name : String
    var image: String
    var music: String
    var duration: String
    
}
var listeaccuils = [
    Listeacceuil(name: "Son de pluie", image: "pluie", music: "music", duration: "5:40"),
    Listeacceuil(name: "Son de cheminée", image: "chemine", music: "musicfire", duration: "6:40"),
    Listeacceuil(name: "Son d'orage", image: "orage", music: "rain", duration: "8:50"),
    Listeacceuil(name: "Son du vent", image: "vent", music: "wind", duration: "9:10"),
    Listeacceuil(name: "Son de baleines", image: "whale", music: "whale", duration: "8:10"),
    Listeacceuil(name: "Son d'oiseaux", image: "bird", music: "bird", duration: "9:10")
]

    



