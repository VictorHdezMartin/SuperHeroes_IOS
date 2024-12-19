//
//  SuperheroResponse.swift
//  SuperHeroes_IOS
//
//  Created by Tardes on 18/12/24.
//

import Foundation

struct SuperheroResponse: Codable {
    let results: [SuperheroClass]
}

struct SuperheroClass: Codable {
    let id: String
    let name: String
    let biography: Biography
    let powerstats: Powerstats
    let appearance: Appearance
    let work: Work
    let connections: Connections
    let image: Image
}

struct Biography: Codable {
    let realName: String
    let publisher: String
    let alignment: String
    let placeOfBirth: String
    let firstAppearance: String

    private enum CodingKeys : String, CodingKey {
        case alignment, publisher
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
    }
}

struct Powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct Appearance: Codable {
    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String
    
    private enum CodingKeys : String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

struct Work: Codable {
    let occupation: String
    let base: String
}

struct Connections: Codable {
    let groupAffiliation: String
    let relatives: String
    
    private enum CodingKeys : String, CodingKey {
        case relatives
        case groupAffiliation = "group-affiliation"
    }
}

struct Image: Codable {
    let url: String
}

