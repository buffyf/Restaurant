//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Barbara Feinstein on 4/13/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let menuController = MenuController()
    var categories = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuController.shared.fetchCategories{ (categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
            }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as!
            MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
            
        }
    }

    func updateUI (with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    
    
    func configure (_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString.capitalized
    }
    
   
   
}
