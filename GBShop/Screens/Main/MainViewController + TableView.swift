//
//  MainViewController + TableView.swift
//  StoreApp
//
//  Created by Федор Филимонов on 22.10.2021.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogueTableViewCell", for: indexPath) as! CatalogueTableViewCell
        
        cell.nameLabel.text = "Product name"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToProductSegue", sender: self)
        
    }
}
