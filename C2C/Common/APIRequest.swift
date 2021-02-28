//
//  APIRequest.swift
//  C2C
//
//  Created by Yassine ElBadaoui on 2021/02/28.
//

import Foundation

class APIRequest {
	static let accessKey = "11b64ba2c8751a2a182a58ad26dc6c2e"
	
	/// API end point URL components
	let urlComponents: URLComponents = {
		var components = URLComponents()
		components.scheme = "http"
		components.host = "api.currencylayer.com"
		components.path = "/live"
		components.queryItems = [URLQueryItem(name: "access_key", value: APIRequest.accessKey)]
		return components
	}()
	
	func perform<T: Decodable>(with completion: @escaping (T?) -> Void) {
		let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
		let task = session.dataTask(with: urlComponents.url!) { (data, _, _) in
			guard let data = data else {
				completion(nil)
				return
			}
			do {
				completion(try JSON.decoder.decode(T.self, from: data))
			} catch {
				NSLog("error: \(error)")
			}

		}
		task.resume()
	}
}
