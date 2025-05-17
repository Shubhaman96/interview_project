//
//  CountryListViewModelTests.swift
//  Country ListTests
//
//
import XCTest
@testable import Country_List

final class CountryListViewModelTests: XCTestCase {
    var viewModel: CountrySearchListViewModel!
    var sampleCountries: [Country]!

    override func setUp() {
        super.setUp()
        viewModel = CountrySearchListViewModel()

        // Sample countries for testing
        sampleCountries = [
            Country(name: "India", capital: "Delhi", currency: "INR", flagURL: ""),
            Country(name: "Japan", capital: "Tokyo", currency: "JPY", flagURL: ""),
            Country(name: "Germany", capital: "Berlin", currency: "EUR", flagURL: "")
        ]
    }

    override func tearDown() {
        viewModel = nil
        sampleCountries = nil
        super.tearDown()
    }

    func test_filter_withEmptySearch_returnsAll() {
        viewModel.searchText = ""
        let result = viewModel.filter(countries: sampleCountries)
        XCTAssertEqual(result.count, 3)
    }

    func test_filter_withMatchingSearch_returnsFiltered() {
        viewModel.searchText = "ja"
        let result = viewModel.filter(countries: sampleCountries)
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "Japan")
    }

    func test_filter_withNoMatch_returnsEmpty() {
        viewModel.searchText = "xyz"
        let result = viewModel.filter(countries: sampleCountries)
        XCTAssertTrue(result.isEmpty)
    }
}
