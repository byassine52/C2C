//
//  ContentNavigation.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import SwiftUI

struct ContentNavigation: View {
	var body: some View {
		NavigationView {
			ContentView()
		}
		.navigationTitle("Currency Exchange")
	}
}

struct ContentNavigation_Previews: PreviewProvider {
	static var previews: some View {
		ContentNavigation()
	}
}
