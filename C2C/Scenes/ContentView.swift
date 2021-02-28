//
//  ContentView.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/27.
//

import SwiftUI

struct ContentView: View {

	@StateObject private var viewModel = ViewModel()

	@State private var sourceAmount: Double = 1.0
//	@State private var quotes = [String: Double]()
//	@State private var quotesArray = [String: Double]()

	private var currencyFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		// allow no currency symbol, extra digits, etc
		formatter.isLenient = true
		formatter.numberStyle = .currency
		formatter.currencySymbol = ""
		return formatter
	}()
	
	var body: some View {
		VStack {
			sourceCurrencyView
			destinationExchangeList
		}
		.padding(.vertical)
		.onAppear(perform: viewModel.fetchCurrencyConversion)
	}
}

extension ContentView {
	/// Source currency view.
	private var sourceCurrencyView: some View {
		HStack {
			Text("USD")
			TextField(
				"Source Currency",
				value: $sourceAmount,
				formatter: currencyFormatter) { isEditing in
				//					self.isEditing = isEditing
			} onCommit: {
				updateQuotes()
			}
			//				.textFieldStyle(RoundedBorderTextFieldStyle())
			.padding()
			.border(Color(UIColor.separator))
			.keyboardType(.numberPad)
		}
		.padding(.horizontal)
	}
	
	/// Destination exchange list.
	private var destinationExchangeList: some View {
		List(viewModel.currencyConversion?.exchangeRates ?? [ExchangeRate](), id: \.self) { exchangeRate in
			//			ForEach(, id: \.self) { amount in
			HStack {
				Text("\(exchangeRate.currency.rawValue)")
				Spacer()
				Text("\(String(format: "%.02f", sourceAmount * exchangeRate.rate))")
			}
		}
	}
}

extension ContentView {
	
	/// Destination currency name.
	private var destinationCurrency: Double {
		sourceAmount * 2.0
	}
	
	/// Update quotes.
	private func updateQuotes() {
		
	}

//	private func convert(amount: Double, toCurrency currency: String) -> Double {
//		amount * (quotes[currency] ?? 0)
//	}

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ContentView()
		}
	}
}
