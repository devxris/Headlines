//
//  SourceViewModel.swift
//  Headlines
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct SourceViewModel {
	
	var id: String
	var name: String
	var description: String
	
	init(source: Source) {
		id = source.id
		name = source.name
		description = source.description
	}
	
	init(id: String, name: String, description: String) {
		self.id = id
		self.name = name
		self.description = description
	}
}
