//
//  MainScreenView.swift
//  ImageViewer
//
//  Created by Pragyesh Kumar Singh on 02/09/24.
//

import SwiftUI

// MARK: - MainScreenView

struct MainScreenView: View {
    
    // MARK: - Properties
    
    @State private var searchText = ""
    @State private var selectedImageIndex = 0
    @State private var isSearchBarPinned = false
    @State private var animalImages: [String] = []
    @ObservedObject private var viewModel = AnimalListViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ScrollView {
                    // Image Carousel
                    TabView() {
                        ForEach(viewModel.animalImageNames, id: \.self) { animalImageNames in
                            Image(animalImageNames)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 300)
                                .cornerRadius(10)
                                .clipped()
                        }
                    }
                    .padding()
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
            
                    // Animal Cards with Search Bar
                    
                    LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                        Section(header: SearchBarView(searchText: $searchText)
                            .background(Color(.systemBackground))
                            .zIndex(1)) {
                                ForEach(viewModel.filteredAnimals(for: searchText), id: \.self) { animal in
                                    GeometryReader { geometry in
                                        AnimalCardView(animal: animal)
                                            .frame(maxWidth: .infinity)
                                            .padding(.horizontal)
                                            .opacity(viewModel.opacity(for: geometry))
                                    }
                                    .frame(height: 70)
                                }
                            }
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MainScreenView()
        .previewDevice("iPhone 14 Pro")
}
