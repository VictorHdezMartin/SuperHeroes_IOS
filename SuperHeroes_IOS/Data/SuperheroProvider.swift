//
//  SuperheroProvider.swift
//  SuperHeroes_IOS
//
//  Created by Tardes on 18/12/24.
//

import Foundation

class SuperheroProvider {
    
    static let tokenAPI = "0f274f699287b7e0f20005a52387616a"
    
    static func findSuperheroesBy(name: String) async throws -> [SuperheroClass] {
        
        let url = URL(string: "https://superheroapi.com/api/\(tokenAPI)/search/\(name)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
        return result.results
    }
    
    static func findSuperheroesBy(id: String) async throws -> SuperheroClass {
        
        let url = URL(string: "https://superheroapi.com/api/\(tokenAPI)/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(SuperheroClass.self, from: data)
        return result
    }
}

// https://superheroapi.com/api/0f274f699287b7e0f20005a52387616a/3
