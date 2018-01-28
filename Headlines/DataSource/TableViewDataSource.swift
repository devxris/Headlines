//
//  TableViewDataSource.swift
//  Headlines
//
//  Created by Chris Huang on 28/01/2018.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import UIKit

class TableViewDataSource<Cell: UITableViewCell, ViewModel>: NSObject, UITableViewDataSource {
	
	private var cellIdentifier: String
	private var viewModels: [ViewModel]
	var configureCell: (Cell, ViewModel) -> ()
	
	init(withIdentifier: String, viewModels: [ViewModel], configureCell: @escaping (Cell, ViewModel) -> ()) {
		self.cellIdentifier = withIdentifier
		self.viewModels = viewModels
		self.configureCell = configureCell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
		let viewModel = viewModels[indexPath.row]
		configureCell(cell, viewModel)
		return cell
	}
}
