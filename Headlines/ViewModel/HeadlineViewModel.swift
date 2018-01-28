//
//  HeadlineViewModel.swift
//  Headlines
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

struct HeadlineViewModel {
	
	var title: String
	var description: String
	
	init(headline: Headline) {
		title = headline.title
		description = headline.description
	}
}
