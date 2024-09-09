//
//  AnimalViewModel.swift
//  ImageViewer
//
//  Created by Pragyesh Kumar Singh on 02/09/24.
//

import SwiftUI

class AnimalListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var animalDetails = [AnimalDetailModel]()
    @Published var animalImageNames: [String] = []
    
    // MARK: - Initialization
    init() {
        loadAnimalDetails()
        fetchImageNames()
    }
    
    // MARK: - Fetching Images

    func fetchImageNames() {
        if let url = Bundle.main.url(forResource: "animals", withExtension: "json") {
            print("File path: \(url)")
            do {
                let data = try Data(contentsOf: url)
                print("Data loaded: \(data)")
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([AnimalDetailModel].self, from: data)
                self.animalImageNames = decodedData.map { $0.imageName }
                print("Animal Images loaded successfully.")
            } catch {
                print("Failed to load animal image data: \(error.localizedDescription)")
                self.animalImageNames = []
            }
        }
    }
    
    // MARK: - Loading Animal Data
    
    private func loadAnimalDetails() {
        if let url = Bundle.main.url(forResource: "animals", withExtension: "json") {
            print("File path: \(url)")
            do {
                let data = try Data(contentsOf: url)
                print("Data loaded: \(data)")
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([AnimalDetailModel].self, from: data)
                self.animalDetails = decodedData
                print("Animal details loaded successfully.")
            } catch {
                print("Failed to load animal data: \(error.localizedDescription)")
                self.animalDetails = []
            }
        } else {
            print("File not found")
            self.animalDetails = []
        }
    }
    

    // MARK: - Filtering
    func filteredAnimals(for searchText: String) -> [AnimalDetailModel] {
        return animalDetails.filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    // MARK: - UI Helpers
    func opacity(for geometry: GeometryProxy) -> Double {
        let minY = geometry.frame(in: .global).minY
        let threshold: CGFloat = 100.0
        return minY < threshold ? 0.0 : 1.0
    }
}

