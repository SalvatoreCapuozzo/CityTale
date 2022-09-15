//
//  ParametersInput.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 15/09/22.
//

import Foundation

class ParametersInput {
    var epochsInput: [Epoch: Float]
    var topicInput: [Topic: Float]
    var attractionInput: [Attraction: Float]
    var aimInput: [DestinationAim: Float]
    
    init(epochsInput: [Epoch: Float], topicInput: [Topic: Float], attractionInput: [Attraction: Float], aimInput: [DestinationAim: Float]) {
        self.epochsInput = epochsInput
        self.topicInput = topicInput
        self.attractionInput = attractionInput
        self.aimInput = aimInput
    }
}
