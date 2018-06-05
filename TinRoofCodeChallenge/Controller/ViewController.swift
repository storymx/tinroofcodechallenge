//
//  ViewController.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var appConstraints:[NSLayoutConstraint]?
    
    let cellId = "cellId"
    
    var sortedUsers:[User]?{
        didSet{
//            guard let unwrappedSortedUsers = sortedUsers else { return }
            self.tableContainer.reloadData()
        }
    }
    
    var users:[User]?{
        didSet{
            guard let unwrappedUsers = users else {return}
            
            let sortedUsrs = unwrappedUsers.sorted { (a, b) -> Bool in
                return a.incomplete > b.incomplete
            }
            
            self.sortedUsers = sortedUsrs
        }
    }
    
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
    
    lazy var tableContainer:UITableView = {
        let tv = UITableView()
        
        tv.delegate = self
        tv.dataSource = self
        
        tv.backgroundColor = .clear
        
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NHService.shared.makeGETCall(url: EndPoints.posts) { (users) in
            self.users = users
        }
        
        setupViews()
        
    }

}

