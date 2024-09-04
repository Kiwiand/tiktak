//
//  Label.swift
//  Simplegames
//
//  Created by user on 26.04.2024.
//

import UIKit
class ScoreLabel: UILabel {
    struct ViewModel {
        let crossesScore: Int
        let zeroScore: Int
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {}
    
    func configure(with viewModel: ViewModel) {
        text = "\(viewModel.crossesScore):\(viewModel.zeroScore)"
        textColor = .white
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 32)
    }
    
}
