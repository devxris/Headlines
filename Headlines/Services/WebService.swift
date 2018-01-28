//
//  WebService.swift
//  Headlines
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class WebService {
	
	static var shared = WebService()
	
	func loadSources(_ completion: @escaping ([Source]) -> ()) {
		
		let sourceURL = URL(string :"https://newsapi.org/v2/sources?apiKey=0cf790498275413a9247f8b94b3843fd")!
		
		URLSession.shared.dataTask(with: sourceURL) { (data, response, error) in
			if let data = data {
				if let main = try? JSONDecoder().decode(Main.self, from: data), let sources = main.sources {
					DispatchQueue.main.async { completion(sources) }
				}
			} else if let error = error {
				print("Can't load sources: \(error.localizedDescription)")
			}
		}.resume()
	}
}
