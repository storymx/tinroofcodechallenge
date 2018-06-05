//
//  ViewController+UIExtension.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func setupViews(){
    
        view.addSubview(tableContainer)
        tableContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        setupConstraints()
        cellConfig()
    }
    
    
    func setupConstraints(){
        
        appConstraints = [
            
            tableContainer.topAnchor.constraint(equalTo: view.topAnchor),
            tableContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ]
        
        NSLayoutConstraint.activate(appConstraints!)
        
    }
    
    func cellConfig(){
        self.tableContainer.register(UserCell.self, forCellReuseIdentifier: cellId)
    }
    
}
