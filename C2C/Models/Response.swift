//
//  Response.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import Foundation

/// API Response
struct Response: Decodable {
	let success: Bool
	let timestamp: Date
	let source: Currency
	let quotes: [String: Double]
}
