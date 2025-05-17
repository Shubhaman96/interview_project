//
//  CountryListView.swift
//  Country List
//
//

import SwiftUI
import SwiftData

struct CountryListView: View {
    
    @State private var isSearching: Bool = false
    @StateObject private var locationManager = LocationManager()
    @State private var countryViewModel = CountryListViewModel()
    @Environment(\.modelContext) private var context
    @Query private var storedCountries: [Country]
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isSearching {
                    CountrySearchListView(isSearching: $isSearching, countryViewModel: $countryViewModel, countryList: storedCountries)
                }else {
                    VStack {
                        List {
                            ForEach(countryViewModel.countryList) { country in
                                NavigationLink(destination: CountryDetailView(country: country)) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(country.name ?? "").font(.headline)
                                            Text("Capital: \(country.capital ?? "" )").font(.subheadline)
                                        }
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                for index in indexSet {
                                    countryViewModel.countryList.remove(at: index)
                                }
                                if countryViewModel.countryList.isEmpty {
                                    countryViewModel.addFirstCountryToList(countries: storedCountries, countryName: locationManager.countryName.isEmpty ? "India" : locationManager.countryName)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Countries")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isSearching.toggle()
                        }
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .padding()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    VStack(spacing: 16) {
                        if locationManager.permissionDenied {
                            Text("permission denied")
                                .foregroundColor(.red)
                           
                            
                        } else if locationManager.countryName.isEmpty {
                            Text("country is empty")
                                .foregroundColor(.red)
                          
                            //ProgressView("Detecting your country...")
                        } else {
                            
                            Text("\(locationManager.countryName)")
                                .font(.title)
                        }
                    }
                }
               
            }
        }
        .onAppear() {
            if storedCountries.isEmpty {
                countryViewModel.fetchInitialCountries(model: context)
            }
            if countryViewModel.countryList.isEmpty {
                countryViewModel.addFirstCountryToList(countries: storedCountries, countryName: locationManager.countryName.isEmpty ? "India" : locationManager.countryName)
            }
            
           
        }
        
       
    }
}

#Preview {
    CountryListView()
}
