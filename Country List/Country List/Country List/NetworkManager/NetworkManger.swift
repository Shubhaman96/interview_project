//
//  NetworkManger.swift
//  Country List
//

//


// MARK: - Services/APIService.swift

import Foundation
import SwiftUI
import SwiftData

@Model
class Country {
    var name: String?
    var capital: String?
    var currency: String?
    var flagURL: String?

    init(name: String, capital: String, currency: String, flagURL: String) {
        self.name = name
        self.capital = capital
        self.currency = currency
        self.flagURL = flagURL
    }
}



import Foundation
import SwiftUI
class APIService {
    static let shared = APIService()

    func fetchCountries(completion: @escaping ([Country]) -> Void) {
        guard let url = URL(string: "https://restcountries.com/v2/all") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoded = try JSONDecoder().decode([CountryDTO].self, from: data)
                let countries = decoded.map {
                    Country(name: $0.name ?? "",
                            capital: $0.capital ?? "Unknown",
                            currency: $0.currencies?.first?.name ?? "",
                            flagURL: $0.flag ?? "")
                }
                DispatchQueue.main.async {
                    completion(countries)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}

struct CountryDTO: Codable {
    let name: String?
    let capital: String?
    let currencies: [Currency]?
    let flag: String?

    struct Currency: Codable {
        let name: String?
    }
}
