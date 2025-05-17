//
//  CountrySearchListView.swift
//  Country List
//

//

import SwiftUI

struct CountrySearchListView: View {
    
    @StateObject var viewModel = CountrySearchListViewModel()
    @Binding var isSearching: Bool
    @Binding var countryViewModel: CountryListViewModel
    var countryList: [Country]

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search Country", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                List {
                    ForEach(viewModel.filter(countries: countryList), id: \.name) { country in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(country.name ?? "").font(.headline)
                                    Text("Capital: \(country.capital ?? "" )").font(.subheadline)
                                }
                            }
                            .onTapGesture {
                                isSearching.toggle()
                                if countryViewModel.countryList.count < 5 {
                                   countryViewModel.countryList.append(country)
                                }
                               
                            }
                    }
                }
            }
            .navigationTitle("Countries")
        }
        .onAppear() {
        }
        .background(Color.gray)
    }
   
}

#Preview {
    CountrySearchListView(isSearching: .constant(false), countryViewModel: .constant(CountryListViewModel()), countryList: [])
}
