//
//  Character.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

struct Character {
    let id: Int
    let name: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let imageUrl: URL
    let episodeUrls: [URL]

    var episodeIds: [Int] {
        episodeUrls
            .compactMap {
                Int($0.lastPathComponent)
            }
    }
}

// MARK: - Conformances
extension Character: Identifiable {}
extension Character: Equatable {}

// MARK: - Mock
#if DEBUG
    extension Character {
        static let mock: Character = .init(
            id: 1,
            name: "Rick Sanchez",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .mock,
            location: .mock,
            // swiftlint:disable:next force_unwrapping
            imageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
            episodeUrls: [
                // swiftlint:disable:next force_unwrapping
                URL(string: "https://rickandmortyapi.com/api/episode/1")!,
                // swiftlint:disable:next force_unwrapping
                URL(string: "https://rickandmortyapi.com/api/episode/2")!
            ]
        )
        
        static let characters: [Character] = {
            (0 ... 20).map {
                Character(
                    id: $0,
                    name: "Rick Sanchez - \($0)",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: .mock,
                    location: .mock,
                    // swiftlint:disable:next force_unwrapping
                    imageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/\($0 + 1).jpeg")!,
                    episodeUrls: [
                        // swiftlint:disable:next force_unwrapping
                        URL(string: "https://rickandmortyapi.com/api/episode/1")!,
                        // swiftlint:disable:next force_unwrapping
                        URL(string: "https://rickandmortyapi.com/api/episode/2")!
                    ]
                )
            }
        }()
    }
#endif
