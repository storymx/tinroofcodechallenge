//
//  DetailCell.swift
//  TinRoofCodeChallenge
//
//  Created by Gabriel Perez on 5/22/18.
//  Copyright © 2018 Gabriel Jaramillo. All rights reserved.
//

import Foundation
import UIKit

class DetailCell: UITableViewCell{
    
    var cellConstraints:[NSLayoutConstraint]?
    
    var post:UserPost? {
        didSet{
            
            guard let unwrappedPost = post else { return }
            
            //bind the data with the Controls
            
            titleID.text = " \(unwrappedPost.id)"
            titlePost.text = unwrappedPost.title
            
            if unwrappedPost.completed{
                titleCompleted.text = " Complete "
                
                titleCompleted.backgroundColor = .green
                titleCompleted.textColor = .black
                
                
            }else{
                titleCompleted.text = "Incompleted"
                titleCompleted.backgroundColor = .red
                titleCompleted.textColor = .white
            }
            
        }
    }
    
    let titleID: UILabel = {
        let lbl = UILabel()
        
        lbl.font = UIFont(name: "HelveticaNeue", size: 32)
        lbl.textColor = .white
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    lazy var titlePost: UITextView = {
        let lbl = UITextView()
        
        lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        lbl.textColor = .white
        lbl.backgroundColor = .clear
        lbl.textAlignment = .left
        lbl.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        lbl.isScrollEnabled = false
        lbl.isUserInteractionEnabled = false
        
        return lbl
    }()
    
    let titleCompleted:UILabel = {
        let lbl = UILabel()
        
        lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        lbl.textColor = .white
        lbl.layer.cornerRadius = 30
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        setupViews()
    }
    
    func setupViews(){
        
        addSubview(titleID)
        addSubview(titlePost)
        addSubview(titleCompleted)
        
        titleID.translatesAutoresizingMaskIntoConstraints = false
        titlePost.translatesAutoresizingMaskIntoConstraints = false
        titleCompleted.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        cellConstraints = [
            
            titleID.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            titleID.leftAnchor.constraint(equalTo: leftAnchor, constant: 6),
            titleID.widthAnchor.constraint(equalToConstant: 80),
            titleID.heightAnchor.constraint(equalToConstant: 30),
            
            titlePost.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            titlePost.leftAnchor.constraint(equalTo: titleID.rightAnchor, constant: 12),
            titlePost.rightAnchor.constraint(equalTo: rightAnchor, constant: 6),
            titlePost.heightAnchor.constraint(equalToConstant: frame.height),
            
            titleCompleted.topAnchor.constraint(equalTo: titleID.bottomAnchor, constant: 10),
            titleCompleted.leftAnchor.constraint(equalTo: titleID.leftAnchor),
            titleCompleted.widthAnchor.constraint(equalToConstant: 90),
            titleCompleted.heightAnchor.constraint(equalToConstant: 15),
            
        ]
        
        NSLayoutConstraint.activate(cellConstraints!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








