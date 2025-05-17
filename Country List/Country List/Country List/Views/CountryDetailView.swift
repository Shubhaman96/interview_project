//
//  CountryDetailView.swift
//  Country List
//

//


import SwiftUI
import SwiftData

struct CountryDetailView: View {
    let country: Country?

    var body: some View {
        VStack(spacing: 20) {
            Text("Country: \(country?.name ?? "")").font(.title2)
            Text("Capital: \(country?.capital ?? "")").font(.headline)
            Text("Currency: \(country?.currency ?? "")").font(.subheadline)
        }
        .padding()
        .navigationTitle(country?.name ?? "")
    }
}

#Preview {
    CountryDetailView(country: Country(name: "", capital: "", currency: "", flagURL: ""))
}
