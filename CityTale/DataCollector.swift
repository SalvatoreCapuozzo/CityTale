//
//  DataCollector.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 15/09/22.
//

import Foundation

class DataCollector {
    static let shared = DataCollector()
    /*
    func getCSVData() -> Array<String> {
        do {
            let content = try String(contentsOfFile: "./citytale.csv")
            let parsedCSV: [String] = content.components(
                separatedBy: "\n"
            ).map{ $0.components(separatedBy: ",")[0] }
            return parsedCSV
        }
        catch {
            return []
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    */
    func loadJsonToDestination() -> [DestinationCodable]? {
        if let url = Bundle.main.url(forResource: "citytale", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([DestinationCodable].self, from: data)
                //let dests = jsonData.map { $0.destination }
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func loadJsonToDestType() -> [DestTypeCodable]? {
        if let url = Bundle.main.url(forResource: "citytale_type", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([DestTypeCodable].self, from: data)
                //let dests = jsonData.map { $0.destination }
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func codableToWeights(destination: [DestinationCodable], destType: [DestTypeCodable]) -> [Destination] {
        var destArray: [Destination] = []
        for dest in destination {
            var epochWeights: [Epoch: Float] = [:]
            epochWeights[.rome] = dest.Roma
            epochWeights[.middleage] = dest.Medio
            epochWeights[.reinassance] = dest.Rinascimento
            epochWeights[._600] = dest._600
            epochWeights[._700] = dest._700
            epochWeights[._800] = dest._800
            epochWeights[._900] = dest._900
            epochWeights[._2000] = dest._2000
            var topicWeights: [Topic: Float] = [:]
            topicWeights[.military] = dest.Militare
            topicWeights[.social] = dest.Sociale
            topicWeights[.holy] = dest.Sacro
            topicWeights[.government] = dest.Governo
            topicWeights[.culture] = dest.Cultura
            topicWeights[.symbols] = dest.Simboli
            var attractionWeights: [Attraction: Float] = [:]
            attractionWeights[.building] = dest.Edificio
            attractionWeights[.single] = dest.OpSingole
            attractionWeights[.urban] = dest.Urban
            attractionWeights[.person] = dest.Persona
            attractionWeights[.event] = dest.Eventi
            attractionWeights[.collection] = dest.Collezione
            var aimWeights: [DestinationAim: Float] = [:]
            for dt in destType {
                if dt.Tipologia == dest.Tipologia {
                    aimWeights[.culturalVisit] = dt.VisitaCulturale
                    aimWeights[.natureRelax] = dt.NaturaRelax
                }
            }
            
            let destWeights = Destination(title: dest.Titolo, destinationType: DestinationType.stringToEnum(string: dest.Tipologia), epochsWeights: epochWeights, topicWeights: topicWeights, attractionWeights: attractionWeights, aimWeights: aimWeights)
            destArray.append(destWeights)
        }
        return destArray
    }
    
    init() {
        let list = loadJsonToDestination() ?? []
        let type_list = loadJsonToDestType() ?? []
        let destArray = codableToWeights(destination: list, destType: type_list)
        self.destinationsList = destArray
        
        /*
        var architecture: [DestinationAim: Float] = [:]
        architecture[.culturalVisit] = 0.35
        architecture[.natureRelax] = 0.15
        var urbanistics: [DestinationAim: Float] = [:]
        urbanistics[.culturalVisit] = 0.15
        urbanistics[.natureRelax] = 0.35
        var museum: [DestinationAim: Float] = [:]
        museum[.culturalVisit] = 0.70
        museum[.natureRelax] = 0.0
        var park: [DestinationAim: Float] = [:]
        park[.culturalVisit] = 0.05
        park[.natureRelax] = 0.45
        var archeological: [DestinationAim: Float] = [:]
        archeological[.culturalVisit] = 0.25
        archeological[.natureRelax] = 0.25
        self.typeWeights[DestinationType.architecture] = architecture
        self.typeWeights[DestinationType.urbanistics] = urbanistics
        self.typeWeights[DestinationType.museum] = museum
        self.typeWeights[DestinationType.park] = park
        self.typeWeights[DestinationType.archeological] = archeological
        */
        //print(destinationsList)
    }
    
    var destinationsList: [Destination] = []
    //var typeWeights: [DestinationType: [DestinationAim: Float]] = [:]
    var parametersInput: ParametersInput? = nil
}
