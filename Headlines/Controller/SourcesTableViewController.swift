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
	
	// MARK: ViewController Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		sourcesTableViewModel = SourcesTableViewModel { self.tableView.reloadData() }
    }
	
	// MARK: UITableViewDataSource
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourcesTableViewModel.sourceViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SourceTableViewCell
        let source = sourcesTableViewModel.source(at: indexPath)
        cell.titleLabel.text = source.name
        cell.descriptionLabel.text = source.description
        return cell
    }
	
	// MARK: Navigations
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let headlinesTVC = segue.destination as? HeadlinesTableViewController else { return }
		guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let sourceViewModel = sourcesTableViewModel.source(at: indexPath)
        headlinesTVC.sourceViewModel = sourceViewModel		
    }
}
