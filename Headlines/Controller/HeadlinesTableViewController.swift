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
	
	// MARK: ViewController Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
		guard let sourceViewModel = sourceViewModel else { return }
        title = sourceViewModel.name
		headlineTableViewModel = HeadlineTableViewModel(sourceViewModel: sourceViewModel) {
			self.tableView.reloadData()
		}
    }
	
	// MARK: UITableViewDataSource
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlineTableViewModel?.headlineViewModels.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HeadlineTableViewCell
        let headline = headlineTableViewModel.headline(at: indexPath)
        cell.titleLabel.text = headline.title
        cell.descriptionLabel.text = headline.description
        return cell
    }
}
