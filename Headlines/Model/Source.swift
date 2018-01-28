//
//  Source.swift
//  HeadlinesApp
//
//  Created by Chris Huang on 28/1/18.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct Main: Codable {
	
	var sources: [Source]?
}

struct Source: Codable {
	
	var id: String
	var name: String
	var description: String
	
	init(sourceViewModel: SourceViewModel) {
		id = sourceViewModel.id
		name = sourceViewModel.name
		description = sourceViewModel.description
	}
}
