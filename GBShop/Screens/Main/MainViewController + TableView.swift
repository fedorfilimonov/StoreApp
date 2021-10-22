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
        
        var productRange: Array = []
        
        for i in 1...5 {
            
        }
        
        
        cell.nameLabel.text = "Product name"
        
        return cell
        
        //        // if row number <= number of visas -> load cell of visa type
        //        // else load cell of "add visa" type
        //
        //        let count = filteredVisaList?.count ?? 0
        //
        //        if indexPath.row < count {
        //
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "MainVisaListCell", for: indexPath) as! MainVisaListCell
        //
        //            cell.countryName.text = self.filteredVisaList?[indexPath.row].country
        //
        //            // Converting format of dates Date() -> String()
        //            let dateFormatter = DateFormatter()
        //            dateFormatter.dateStyle = .medium
        //
        //            // Adding text to label
        //            // If expiry date is OK -> show date, if nil -> show "-"
        //            if self.filteredVisaList?[indexPath.row].expiryDate != nil {
        //                cell.expiryDateResult.text = dateFormatter.string(from: (self.filteredVisaList?[indexPath.row].expiryDate)!)
        //            }
        //
        //            else {
        //                cell.expiryDateResult.text = "-"
        //            }
        //
        //            // If there are both issue and expiry dates -> show how many months left, if no -> show "-"
        //            if let expiryDate = self.filteredVisaList?[indexPath.row].expiryDate {
        //
        //                let today = Date()
        //                let timeLeftUntilExpiry = Calendar.current.dateComponents([.year, .month, .day], from: today, to: expiryDate)
        //
        //                if timeLeftUntilExpiry.year! < 1 && timeLeftUntilExpiry.month! < 1 && timeLeftUntilExpiry.day! < 1 {
        //                    cell.expiryInResult.text = NSLocalizedString("Expired", comment: "")
        //                    cell.expiryInResult.textColor = .red
        //
        //                }
        //
        //                else if timeLeftUntilExpiry.year! < 1 && timeLeftUntilExpiry.month! < 1 && timeLeftUntilExpiry.day! >= 1 {
        //                    cell.expiryInResult.text = String(timeLeftUntilExpiry.day!) + " " + expiryCountUniversal(count: timeLeftUntilExpiry.day!, item: "days number")
        //                }
        //
        //                else if timeLeftUntilExpiry.year! < 1 && timeLeftUntilExpiry.month! >= 1 {
        //                    cell.expiryInResult.text = String(timeLeftUntilExpiry.month!) + " " + expiryCountUniversal(count: timeLeftUntilExpiry.month!, item: "months number") + " " + String(timeLeftUntilExpiry.day!) + " " + expiryCountUniversal(count: timeLeftUntilExpiry.day!, item: "days number")
        //                }
        //
        //                else if timeLeftUntilExpiry.year! >= 1 && timeLeftUntilExpiry.month! == 0 {
        //                    cell.expiryInResult.text = String(timeLeftUntilExpiry.year!) + " " + expiryCountUniversal(count: timeLeftUntilExpiry.year!, item: "years number")
        //                }
        //
        //                else {
        //                    cell.expiryInResult.text = String(timeLeftUntilExpiry.year!) + " " + expiryCountUniversal(count: timeLeftUntilExpiry.year!, item: "years number") + " " + String(timeLeftUntilExpiry.month!) + " " + expiryCountUniversal(count: timeLeftUntilExpiry.month!, item: "months number")
        //                }
        //            }
        //
        //            else {
        //                cell.expiryInResult.text = "-"
        //            }
        //
        //            if UIImage(named: "\(self.filteredVisaList![indexPath.row].country)") != nil {
        //                cell.countryImage.image = UIImage (named: "\(self.filteredVisaList![indexPath.row].country)")
        //            }
        //
        //            else {
        //                cell.countryImage.image = UIImage (named: "airport")
        //            }
        //
        //            return cell
        //        }
        //
        //        else {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "VisaAddCell", for: indexPath) as! VisaAddCell
        //            cell.addVisaLabel.text = NSLocalizedString("Add new visa", comment: "")
        //            return cell
        //        }
        //    }
        
    }
}
