//
//  CurrencyConversion.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import Foundation

struct CurrencyConversion: Decodable {
	var currency: Currency
	var exchangeRates: [ExchangeRate] {
		return rates.values
	}
	
	private var rates: ExchangeRate.List
	
}

/*
extension CurrencyConversion {
	enum CodingKeys: String, CodingKey {
		case currency = "source"
	}
}
*/
