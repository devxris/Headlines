//
//  SourcesTableViewController.swift
//  HeadlinesApp
//
//  Created by Chris Huang on 28/1/18.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation
import UIKit

class SourcesTableViewController : UITableViewController {
	
	// MARK: ViewModels
    
	private var sourcesTableViewModel: SourcesTableViewModel!
	private var dataSource: TableViewDataSource<SourceTableViewCell, SourceViewModel>!
	
	// MARK: ViewController Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		sourcesTableViewModel = SourcesTableViewModel {
			self.dataSource = TableViewDataSource(withIdentifier: "Cell", viewModels: self.sourcesTableViewModel.sourceViewModels) { (cell, soureViewModel) in
				cell.titleLabel.text = soureViewModel.name
				cell.descriptionLabel.text = soureViewModel.description
			}
			self.tableView.dataSource = self.dataSource
			self.tableView.reloadData()
		}		
    }
		
	// MARK: Navigations
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let headlinesTVC = segue.destination as? HeadlinesTableViewController else { return }
		guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let sourceViewModel = sourcesTableViewModel.source(at: indexPath)
        headlinesTVC.sourceViewModel = sourceViewModel		
    }
}
