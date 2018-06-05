//
//  ViewController+DelegateExtension.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let numberOfSortedUsers = sortedUsers?.count else { return 0 }
        
        return numberOfSortedUsers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        
//        cell.textLabel?.text = "User ID: \(self.sortedUsers![indexPath.row].userId) , Incomplete To-do's: \(self.sortedUsers![indexPath.row].incomplete)"
        
        guard let unwrappedUser = self.sortedUsers?[indexPath.row] else { return  cell}

        cell.user = unwrappedUser
        
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let iPath = tableView.indexPathForSelectedRow
        
        let detailController = DetailViewController()
        detailController.user = users![(iPath?.row)!]
        
        
        navigationController?.pushViewController(detailController, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
