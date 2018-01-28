//
//  HeadlinesTableViewController.swift
//  HeadlinesApp
//
//  Created by Chris Huang on 28/1/18.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation
import UIKit

class HeadlinesTableViewController : UITableViewController {
	
	// MARK: ViewModels
	
	var sourceViewModel: SourceViewModel?
	private var headlineTableViewModel: HeadlineTableViewModel!
	private var dataSource: TableViewDataSource<HeadlineTableViewCell, HeadlineViewModel>!
	
	// MARK: ViewController Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
		
		guard let sourceViewModel = sourceViewModel else { return }
        title = sourceViewModel.name
		
		headlineTableViewModel = HeadlineTableViewModel(sourceViewModel: sourceViewModel) {
			self.dataSource = TableViewDataSource(withIdentifier: "Cell", viewModels: self.headlineTableViewModel.headlineViewModels) { (cell, headlineViewModel) in
				cell.titleLabel.text = headlineViewModel.title
				cell.descriptionLabel.text = headlineViewModel.description
			}
			self.tableView.dataSource = self.dataSource
			self.tableView.reloadData()
		}
    }
}
