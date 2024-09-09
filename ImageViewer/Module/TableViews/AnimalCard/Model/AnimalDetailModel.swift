//
//  AnimalModel.swift
//  ImageViewer
//
//  Created by Pragyesh Kumar Singh on 02/09/24.
//

import Foundation

// MARK: - AnimalDetailModel

/// A struct representing the details of an animal
struct AnimalDetailModel: Codable, Hashable, Identifiable {
    
    // MARK: - CodingKeys Enum
    enum CodingKeys: CodingKey {
        case name
        case imageName
    }
    
    // MARK: - Properties
    var id = UUID()
    
    /// The name of the animal
    let name: String
    
    /// The name of the image file associated with the animal
    let imageName: String
}
