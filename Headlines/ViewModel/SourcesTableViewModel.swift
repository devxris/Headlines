//
//  SourcesTableViewModel.swift
//  Headlines
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class SourcesTableViewModel {
	
	private(set) var sourceViewModels = [SourceViewModel]()
	private var completion: () -> () = { }
	
	init(_ completion: @escaping () -> ()) {
		self.completion = completion
		WebService.shared.loadSources { (sources) in
			self.sourceViewModels = sources.map { SourceViewModel(source: $0) }
			self.completion()
		}
	}
	
	func source(at indexPath: IndexPath) -> SourceViewModel { return sourceViewModels[indexPath.row] }
}
