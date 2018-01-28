//
//  Headline.swift
//  HeadlinesApp
//
//  Created by Chris Huang on 28/1/18.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct Top: Codable {
	
	var articles: [Headline]?
}

struct Headline: Codable {
	
	var title: String
	var description: String
}
