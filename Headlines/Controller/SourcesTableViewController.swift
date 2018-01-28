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
    
	private var sources = [Source]() { didSet { tableView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
		WebService.shared.loadSources { (sources) in self.sources = sources }
    }
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sources.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SourceTableViewCell
        
        let source = self.sources[indexPath.row]
        cell.titleLabel.text = source.name
        cell.descriptionLabel.text = source.description
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let headlinesTVC = segue.destination as? HeadlinesTableViewController else {
            fatalError("HeadlinesTableViewController not found")
        }
        
        let indexPath = (self.tableView.indexPathForSelectedRow)!
        let source = self.sources[indexPath.row]
        
        headlinesTVC.source = source
        
    }
   
}








