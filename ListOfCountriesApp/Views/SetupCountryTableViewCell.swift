//
//  SetupCountryTableViewCell.swift
//  ListOfCountriesApp
//
//  Created by Saichander Sunkari on 12/03/25.
//

import UIKit

class SetupCountryTableViewCell: UITableViewCell {
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private let capitalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(countryLabel)
        contentView.addSubview(capitalLabel)
        
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            capitalLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            capitalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with country: Country) {
        let countryInfo = "\(country.name ?? "Unknown"), \(country.region ?? "Unknown")"
        let countryCode = country.code ?? "--"
        
        let formattedText = NSMutableAttributedString(string: "\(countryInfo)     \(countryCode)")
        
        let capitalText = country.capital ?? "No Capital"
        
        countryLabel.attributedText = formattedText
        capitalLabel.text = capitalText
    }
}

