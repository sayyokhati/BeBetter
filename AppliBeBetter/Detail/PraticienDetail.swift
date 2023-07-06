//
//  PraticienDetail.swift
//  BeBetter
//
//  Created by apprenant62 on 19/06/2023.
//

import Foundation

enum Jobname: String {
    case ostéopathe = "Ostéopathe"
    case masseur = "Masseur"
    case kinésithérapeute = "Kinésithérapeute"
    case professeurDeYoga = "Professeur de yoga"
    case acupuncture = "Acupuncture"
    case dieteticien = "Diététicien"
    case escalade = "Cours d'escalade"
}

struct Praticien : Identifiable {
    var id: UUID = UUID()
    var name : String
    var job : Jobname
    var jobDescription: String
    var image: String
}

var ChloeDelarue = Praticien(name: "Mme Chloé Delarue", job: .masseur, jobDescription: "La médecine traditionnelle chinoise est restée plus proche de l'étymologie : elle est la science et la pratique étudiant la santé humaine. Le massage Tui Na (pousser saisir) est une des branches de la médecine traditionnelle chinoise. Il s'agit de techniques et mobilisations pour disperser les blocages, tonifier ou stimuler l'énergie. Son objectif est de rétablir les circulations d'énergie pour rééquilibrer le corps et l'esprit. ", image: "Chloé")
var LaureXavier = Praticien(name: "Mme Laure Xavier", job: .kinésithérapeute, jobDescription: "Le masseur-kinésithérapeute est le praticien en charge du renforcement musculaire, de l'endurance et de la mobilité des personnes ayant des limitations fonctionnelles. Pour cela, il pratique des massages et réalise avec les patients des exercices afin de leur permettre de retrouver une meilleure condition physique.", image: "Laure")
var MartinRandal = Praticien(name: "M Martin Randal", job: .ostéopathe, jobDescription: "L’ostéopathie est une approche thérapeutique manuelle douce qui se fonde sur une vision holistique (globale) d'une personne, la considérant en tant qu'unité.", image: "Martin")
var LucieLau = Praticien(name: "Mme Lucie Lau", job: .professeurDeYoga, jobDescription: "Les séances de yoga que je vous propose sont toutes différentes, permettant ainsi de rester vigilant à chaque instant. Guidées par la respiration, les Asanas (postures) deviennent un état de présence et lieu de méditation. Ainsi préparé, il vous sera plus aisé d’expérimenter ou d’approfondir Dhyana (méditation).", image: "LucieYoga")
var AntoineMeunier = Praticien(name: "M Antoine Meunier", job: .escalade, jobDescription: "Escaladeur de 16 ans d’expérience de haut niveau en falaise et en salle dans les regions montagneuses de Colombie. Spécialisé en escalade sportive en falaise.Participation á un mondial et à des competitions en Amerique latine. Entrainement rigoureux depuis toujours.", image: "Antoine")
var RominaCourtaut = Praticien(name: "Mme Romina Courtaut", job: .dieteticien, jobDescription: "Diététicienne - Nutritionniste diplômée d'Etat, je vous propose des consultations diététiques à Lyon 2ème pour personnes en bonne santé ou avec des pathologies qui requièrent un accompagnement au niveau nutritionnel. Durant les consultations, nous fixerons ensemble des objectifs personnels en lien avec votre alimentation sans aucun jugement et en respectant votre rythme de vie. Nous mettrons en œuvre les moyens pour retrouver une alimentation saine, équilibrée et adaptée à vos besoins, sans frustrations et sans régimes restrictifs.", image: "Romina")
var ValentinReille = Praticien(name: "Dr Valentin Reille", job: .acupuncture, jobDescription: "« L'Acupuncture Traditionnelle forme un art thérapeutique qui élabore son raisonnement diagnostique et thérapeutique sur une vision énergétique Taoïste de l’Homme et de l’Univers. »Le mot acupuncture a été inventé par les jésuites au 16ème siècles lorsqu'ils ont découvert la médecine chinoise, le vrai nom est Zhen Jiu qui signifie l'art des aiguilles de métal et de la moxibustion.", image: "Valentin")



let allPraticien : [Praticien] = [ChloeDelarue, LaureXavier, MartinRandal, LucieLau]
var ostéopathe : [Praticien] = [MartinRandal]
var masseur : [Praticien] = [ChloeDelarue]
var kiné : [Praticien] = [LaureXavier]
var yoga : [Praticien] = [LucieLau]
var escalade : [Praticien] = [AntoineMeunier]
var dieteticien : [Praticien] = [RominaCourtaut]
var acunpuncteur : [Praticien] = [ValentinReille]

// health(santé) = ostéo, kiné, diététicien
// wellness (bien-être) = masseur, acupuncture
// sport = yoga, escalade, salle de sport

var tabOfHealth : [Praticien] = [MartinRandal, LaureXavier, RominaCourtaut]
var tabOfWellness : [Praticien] = [ChloeDelarue, ValentinReille]
var tabOfSport : [Praticien] = [LucieLau, AntoineMeunier]




