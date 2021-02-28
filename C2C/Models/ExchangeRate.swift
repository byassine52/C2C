//
//  Quote.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import Foundation

/// Quote.
struct ExchangeRate: Hashable {
	let currency: Currency
	let rate: Double
}

extension ExchangeRate {
	struct List: Decodable {
		let values: [ExchangeRate]
		
		init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let dictionary = try container.decode([String : Double].self)

			values = dictionary.map { key, value in
				let currencyName = key == "USD" ? "USD" : key.replacingOccurrences(of: "USD", with: "")
				return ExchangeRate(currency: Currency(rawValue: currencyName) ?? .usd, rate: value)
			}
		}
	}
}
