//
//  Item.swift
//  Country List
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}





// CountryExplorerApp.swift
import SwiftUI
import SwiftData
//
//@main
//struct CountryExplorerApp: App {
//    var body: some Scene {
//        WindowGroup {
//            CountryListView()
//        }
//        .modelContainer(for: Country.self)
//    }
//}

// MARK: - Models/Country.swift
import Foundation
import SwiftData

//@Model
//class Country {
//    @Attribute(.unique) var name: String
//    var capital: String
//    var currency: String
//    var flagURL: String
//
//    init(name: String, capital: String, currency: String, flagURL: String) {
//        self.name = name
//        self.capital = capital
//        self.currency = currency
//        self.flagURL = flagURL
//    }
//}

//// MARK: - Services/APIService.swift
//import Foundation
//
//class APIService {
//    static let shared = APIService()
//
//    func fetchCountries(completion: @escaping ([Country]) -> Void) {
//        guard let url = URL(string: "https://restcountries.com/v2/all") else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else { return }
//
//            do {
//                let decoded = try JSONDecoder().decode([CountryDTO].self, from: data)
//                let countries = decoded.map {
//                    Country(name: $0.name,
//                            capital: $0.capital ?? "Unknown",
//                            currency: $0.currencies.first?.name ?? "",
//                            flagURL: $0.flag)
//                }
//                DispatchQueue.main.async {
//                    completion(countries)
//                }
//            } catch {
//                print("Decoding error: \(error)")
//            }
//        }.resume()
//    }
//}
//
//struct CountryDTO: Codable {
//    let name: String
//    let capital: String?
//    let currencies: [Currency]
//    let flag: String
//
//    struct Currency: Codable {
//        let name: String?
//    }
//}
//
//// MARK: - ViewModels/CountryListViewModel.swift
//import Foundation
//import SwiftData
//
//@Observable
//class CountryListViewModel {
//    var searchText: String = ""
//    var filteredCountries: [Country] = []
//
//    func fetchInitialCountries(context: ModelContext) {
//        APIService.shared.fetchCountries { countries in
//            for country in countries.prefix(5) {
//                context.insert(country)
//            }
//        }
//    }
//
//    func filter(countries: [Country]) -> [Country] {
//        guard !searchText.isEmpty else { return countries }
//        return countries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
//    }
//}

// MARK: - Views/CountryListView.swift
//import SwiftUI
//import SwiftData
//
//struct CountryListView: View {
//    @Environment(\.modelContext) private var context
//    @Query private var storedCountries: [Country]
//    @State private var viewModel = CountryListViewModel()
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                TextField("Search Country", text: $viewModel.searchText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                List {
//                    ForEach(viewModel.filter(countries: storedCountries)) { country in
//                        NavigationLink(destination: CountryDetailView(country: country)) {
//                            HStack {
//                                AsyncImage(url: URL(string: country.flagURL)) { image in
//                                    image.resizable()
//                                } placeholder: {
//                                    ProgressView()
//                                }
//                                .frame(width: 40, height: 30)
//                                .clipShape(RoundedRectangle(cornerRadius: 5))
//
//                                VStack(alignment: .leading) {
//                                    Text(country.name).font(.headline)
//                                    Text("Capital: \(country.capital)").font(.subheadline)
//                                }
//                            }
//                        }
//                    }
//                    .onDelete { indexSet in
//                        for index in indexSet {
//                            context.delete(storedCountries[index])
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Countries")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Load") {
//                        viewModel.fetchInitialCountries(context: context)
//                    }
//                }
//            }
//        }
//    }
//}

// MARK: - Views/CountryDetailView.swift
//import SwiftUI

//struct CountryDetailView: View {
//    let country: Country
//
//    var body: some View {
//        VStack(spacing: 20) {
//            AsyncImage(url: URL(string: country.flagURL)) { image in
//                image.resizable()
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: 200, height: 120)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//
//            Text("Country: \(country.name)").font(.title2)
//            Text("Capital: \(country.capital)").font(.headline)
//            Text("Currency: \(country.currency)").font(.subheadline)
//        }
//        .padding()
//        .navigationTitle(country.name)
//    }
//}
