//
//  ViewModel.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import Foundation

class ViewModel: ObservableObject {
	
	@Published var sourceCurrency: Currency = .usd
	@Published var currencyConversion: CurrencyConversion? 
	
	func fetchCurrencyConversion() {
		let request = APIRequest()
		request.perform { [weak self] (currencyConversion: CurrencyConversion?) in
			guard let currencyConversion = currencyConversion else { return }
			self?.currencyConversion = currencyConversion
		}
	}

}
