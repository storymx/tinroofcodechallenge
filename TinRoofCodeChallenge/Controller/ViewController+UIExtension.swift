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
    
        
        view.addSubview(backgroundImage)
        view.addSubview(blurView)
        view.addSubview(tableContainer)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        tableContainer.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
        cellConfig()
    }
    
    
    func setupConstraints(){
        
        appConstraints = [
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leftAnchor.constraint(equalTo: view.leftAnchor),
            blurView.rightAnchor.constraint(equalTo: view.rightAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
