//
//  AnimalCardView.swift
//  ImageViewer
//
//  Created by Pragyesh Kumar Singh on 02/09/24.
//

import SwiftUI

// MARK: - AnimalCardView

/// A view that displays an animal's image and name in a card-like format
struct AnimalCardView: View {
    
    // MARK: - Properties
    
    let animal: AnimalDetailModel
    private let cardWidth: CGFloat = 300
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 10) {
            // Display the animal image with a fixed size and corner radius
            Image(animal.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            
            // Display the animal name with headline font and some padding
            Text(animal.name)
                .font(.headline)
                .padding(.leading, 10)
            
            // Pushes the content to the left, leaving space on the right
            Spacer()
        }
        .frame(width: cardWidth)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

// MARK: - Preview

#Preview {
    AnimalCardView(animal: AnimalDetailModel(name: "Lion", imageName: "lion-1"))
}
