//
//  UserCell.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell{
    
    var cellConstraints:[NSLayoutConstraint]?
    var user:User? {
        didSet{
            
            guard let unwrappedUser = user else { return }
            
            DispatchQueue.main.async {
                
                self.userLabel.text = "\(unwrappedUser.userId)"
                self.completedLabel.text = "completed to-dos: \(unwrappedUser.complete)"
                self.incompletedLabel.text = "incompleted to-dos: \(unwrappedUser.incomplete)"
                
            }
        }
    }
    
    lazy var container:UIView = {
        let view = UIView()
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 1
        
        return view
    }()
    
    lazy var userLabel:UILabel = {
        let lbl = UILabel()
        
        lbl.backgroundColor = .yellow
        
        lbl.layer.cornerRadius = 12
//        lbl.backgroundColor = .white
        lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 36)
        lbl.textAlignment = .center
        
//        lbl.text = "here!!"
        return lbl
    }()
    
    lazy var completedLabel:UILabel = {
        let lbl = UILabel()
        
        lbl.numberOfLines = 3
        lbl.layer.cornerRadius = frame.width/2
        lbl.font = UIFont(name: "HelveticaNeue", size: 11)
        lbl.backgroundColor = UIColor.greenLight
        lbl.textColor = .black
        
        return lbl
    }()
    
    lazy var incompletedLabel:UILabel = {
        let lbl = UILabel()
        
        lbl.layer.cornerRadius = 16
        lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 8)
        lbl.backgroundColor = UIColor.darkRed
        lbl.textColor = .white
        
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .blueLight
        setupViews()
    }
    
    func setupViews(){
        addSubview(container)
        container.addSubview(userLabel)
        container.addSubview(completedLabel)
        container.addSubview(incompletedLabel)
        container.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        completedLabel.translatesAutoresizingMaskIntoConstraints = false
        incompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        cellConstraints = [
            
            container.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            container.heightAnchor.constraint(equalToConstant: frame.height*0.92),
            container.widthAnchor.constraint(equalToConstant: frame.width*0.92),
            
            userLabel.topAnchor.constraint(equalTo: container.topAnchor),
            userLabel.leftAnchor.constraint(equalTo: container.leftAnchor),
            userLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            userLabel.widthAnchor.constraint(equalToConstant: frame.width*0.35),
            
            completedLabel.topAnchor.constraint(equalTo: container.topAnchor),
            completedLabel.leftAnchor.constraint(equalTo: userLabel.rightAnchor),
            completedLabel.bottomAnchor.constraint(equalTo: container.centerYAnchor),
            completedLabel.rightAnchor.constraint(equalTo: container.rightAnchor),
            
            incompletedLabel.topAnchor.constraint(equalTo: container.centerYAnchor),
            incompletedLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            incompletedLabel.leftAnchor.constraint(equalTo: userLabel.rightAnchor),
            incompletedLabel.rightAnchor.constraint(equalTo: container.rightAnchor)
            
        ]
        
        NSLayoutConstraint.activate(cellConstraints!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
