//
//  SetupCountryModel.swift
//  ListOfCountriesApp
//
//  Created by Saichander Sunkari on 12/03/25.
//

import Foundation

struct Country: Codable {
    var name: String?
    var capital: String?
    var code: String?
    var region: String?
    var flag: String?
    var currency: Currency?
    var language: Language?
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case code
        case region
        case flag
        case currency
        case language
    }
}

struct Currency: Codable {
    var code: String?
    var name: String?
    var symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
    }
}

struct Language: Codable {
    var code: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}
