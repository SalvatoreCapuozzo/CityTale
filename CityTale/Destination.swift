//
//  Destination.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 15/09/22.
//

import Foundation

enum DestinationType {
    case architecture, urbanistics, museum, park, archeological, invalid
    var id: Self { self }
    
    static func stringToEnum(string: String) -> Self {
        if string == "Architettura" {
            return .architecture
        } else if string == "Urbanistica" {
            return .urbanistics
        } else if string == "Museo" {
            return .museum
        } else if string == "Parco" {
            return .park
        } else if string == "Sito archeologico" {
            return .archeological
        }
        return .invalid
    }
}

enum Epoch {
    case rome, middleage, reinassance, _600, _700, _800, _900, _2000
    var id: Self { self }
}

enum Topic {
    case military, social, holy, government, culture, symbols
    var id: Self { self }
}

enum Attraction {
    case building, single, urban, person, event, collection
    var id: Self { self }
}

enum DestinationAim {
    case culturalVisit, natureRelax
}

class Destination {
    var title: String
    //var typeWeights: [DestinationType: [DestinationAim: Float]]
    var destinationType: DestinationType
    var epochsWeights: [Epoch: Float]
    var topicWeights: [Topic: Float]
    var attractionWeights: [Attraction: Float]
    var aimWeights: [DestinationAim: Float] // linked to desttype
    
    init(title: String, destinationType: DestinationType, epochsWeights: [Epoch: Float], topicWeights: [Topic: Float], attractionWeights: [Attraction: Float], aimWeights: [DestinationAim: Float]) {
        self.title = title
        self.destinationType = destinationType
        self.epochsWeights = epochsWeights
        self.topicWeights = topicWeights
        self.attractionWeights = attractionWeights
        self.aimWeights = aimWeights
    }
}

struct DestinationCodable: Codable {
    let Titolo: String
    let Tipologia: String
    let Roma: Float
    let Medio: Float
    let Rinascimento: Float
    let _600: Float
    let _700: Float
    let _800: Float
    let _900: Float
    let _2000: Float
    let Militare: Float
    let Sociale: Float
    let Sacro: Float
    let Governo: Float
    let Cultura: Float
    let Simboli: Float
    let Edificio: Float
    let OpSingole: Float
    let Urban: Float
    let Persona: Float
    let Eventi: Float
    let Collezione: Float
}
/*
class DestType {
    var destinationType: DestinationType
    var aimWeights: [DestinationAim: Float]
    
    init(destinationType: DestinationType, aimWeights: [DestinationAim: Float]) {
        self.destinationType = destinationType
        self.aimWeights = aimWeights
    }
}
*/
struct DestTypeCodable: Codable {
    let Tipologia: String
    let VisitaCulturale: Float
    let NaturaRelax: Float
}

struct ResponseData: Decodable {
    var destination: [DestinationCodable]
}
