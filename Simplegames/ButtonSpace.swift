//
//  File.swift
//  Simplegames
//
//  Created by user on 15.05.2024.
//

import UIKit
class ButtonSpace: UIButton {
    var x: Int = 0
    var y: Int = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        
        super.init(frame: CGRect())
        
        widthAnchor.constraint(equalToConstant: 80).isActive = true
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor  = .black
        layer.borderWidth = 2
        tintColor = .white

        
        layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
