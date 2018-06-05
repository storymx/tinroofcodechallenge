//
//  DetailViewController.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var appConstrains:[NSLayoutConstraint]?
    
    let cellId = "cellId"
    
    var user:User?{
        didSet{
            
            guard let unwrappedUser = user else { return }
            
            let title = "User \(unwrappedUser.userId) To-do's"
            setNavigationTitle(title: title)
            
            self.tableContainer.reloadData()
            
        }
    }
    
    lazy var tableContainer:UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        tableView.backgroundView = UIView()
        
        return tableView
    }()
    
    
    let  backgroundImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "me").withRenderingMode(.alwaysOriginal))
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        
        visualEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return visualEffect
    }()
    
    let titleLabel: UILabel = {
        let tv = UILabel()
    
        tv.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}
