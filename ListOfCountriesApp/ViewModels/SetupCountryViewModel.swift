//
//  SetupCountryViewModel.swift
//  ListOfCountriesApp
//
//  Created by Saichander Sunkari on 12/03/25.
//

import Foundation

class SetupCountryViewModel {
    
    private var allCountries: [Country] = []
    private var filteredCountries: [Country] = []
    var isFiltering: Bool = false
    
    var onDataUpdated: (() -> Void)?
    
    // Computed property to return the correct dataset (filtered or full)
    var countries: [Country] {
        return isFiltering ? filteredCountries : allCountries
    }

    // Fetch countries from API
    func fetchCountries() {
        SetupCountryService.fetchCountries { [weak self] result in
            switch result {
            case .success(let countries):
                self?.allCountries = countries
                self?.onDataUpdated?()
            case .failure(let error):
                print("Error fetching countries: \(error)")
            }
        }
    }
    
    // Filter countries based on query
    func filterCountries(query: String) {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !trimmedQuery.isEmpty else {
            isFiltering = false
            onDataUpdated?() // Refresh to show all countries
            return
        }
        
        isFiltering = true
        filteredCountries = allCountries.filter { country in
            return country.name?.lowercased().contains(trimmedQuery) ?? false ||
                   country.capital?.lowercased().contains(trimmedQuery) ?? false ||
                   country.code?.lowercased().contains(trimmedQuery) ?? false ||
                   country.region?.lowercased().contains(trimmedQuery) ?? false
        }
        onDataUpdated?()
    }
}

