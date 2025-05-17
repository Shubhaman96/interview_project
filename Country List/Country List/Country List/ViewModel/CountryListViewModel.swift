//
//  CountryListViewModel.swift
//  Country List
//
//

// MARK: - ViewModels/CountryListViewModel.swift
import Foundation
import SwiftData


class CountryListViewModel: ObservableObject {
  
    @Published var countryList: [Country] = []

    func fetchInitialCountries(model: ModelContext) {

        APIService.shared.fetchCountries { countries in
            for country in countries {
                model.insert(country)
            }
        }
    }

    func addFirstCountryToList(countries: [Country], countryName: String) {
        if let result =  countries.filter({ $0.name!.localizedCaseInsensitiveContains(countryName)}).first {
            countryList = [result]
        }
    }
}



class CountrySearchListViewModel: ObservableObject {
    
     @Published var searchText: String = ""

    func filter(countries: [Country]) -> [Country] {
        guard !searchText.isEmpty else { return countries }
        return countries.filter { $0.name!.localizedCaseInsensitiveContains(searchText)}
    }
}
