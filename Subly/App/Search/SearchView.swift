//
//  SearchView.swift
//  Subly
//
//  Created by Zülal Sarıoğlu on 31.03.2026.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 16){
                CategoryView()
                PopulerAppView()
            }
        }
        .searchable(text: $searchText, prompt: "Search Application")
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchView()
}
