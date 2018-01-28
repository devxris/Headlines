//
//  HeadlineTableViewModel.swift
//  Headlines
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class HeadlineTableViewModel {
	
	private(set) var headlineViewModels = [HeadlineViewModel]()
	
	init(sourceViewModel: SourceViewModel, completion: @escaping () -> ()) {
		let source = Source(sourceViewModel: sourceViewModel)
		WebService.shared.loadHeadline(for: source) { (headlines) in
			self.headlineViewModels = headlines.map { HeadlineViewModel(headline: $0) }
			DispatchQueue.main.async { completion() }
		}
	}
	
	func headline(at indexPath: IndexPath) -> HeadlineViewModel { return headlineViewModels[indexPath.row] }
}
