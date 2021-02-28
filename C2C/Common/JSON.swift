//
//  JSON.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import Foundation

/// JSON structure.
struct JSON {
	/// Encoder.
	static let encoder: JSONEncoder = {
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .iso8601
		encoder.outputFormatting = .prettyPrinted
		return encoder
	}()
	
	/// Decoder.
	static let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		return decoder
	}()
}
