//
//  SearchBarView.swift
//  ImageViewer
//
//  Created by Pragyesh Kumar Singh on 02/09/24.
//

import SwiftUI

// MARK: - SearchBarView

struct SearchBarView: View {
    
    // MARK: - Properties
    @Binding var searchText: String

    // MARK: - Body
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        }
        .padding(.top, 10)
    }
}

// MARK: - Preview

#Preview {
    SearchBarView(searchText: .constant(""))
}

