//
//  ViewController.swift
//  Simplegames
//
//  Created by user on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {
    enum CrossesOrZero {
        case crosses
        case zero
        case none
    }
    var crossesScore = 0
    var zeroScore = 0
    var playersSwiched = false

    
    var data: [[CrossesOrZero]] = [
        [.none, .none, .none],
        [.none, .none, .none],
        [.none, .none, .none]
    ]
    
    
    var gameIsEnded = false
    
    var currentStep: CrossesOrZero = .crosses
    private lazy var scoreLabel: ScoreLabel = {
        let view = ScoreLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var horisontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var verticalStackViewOne: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var verticalStackViewTwo: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var verticalStackViewFree: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var button11: ButtonSpace = {
        let button = ButtonSpace(x: 1, y: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button12: ButtonSpace = {
        
        let button = ButtonSpace(x: 1, y: 2)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button13: ButtonSpace = {
        let button = ButtonSpace(x: 1, y: 3)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button21: ButtonSpace = {
        let button = ButtonSpace(x: 2, y: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button22: ButtonSpace = {
        let button = ButtonSpace(x: 2, y: 2)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button23: ButtonSpace = {
        let button = ButtonSpace(x: 2, y: 3)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button31: ButtonSpace = {
        let button = ButtonSpace(x: 3, y: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button32: ButtonSpace = {
        let button = ButtonSpace(x: 3, y: 2)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var button33: ButtonSpace = {
        let button = ButtonSpace(x: 3, y: 3)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    var buttons = [ButtonSpace]()
    
    private lazy var buttonRestart: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.tintColor = .white
        //        button.layer.borderColor = UIColor.white.cgColor
        //        button.layer.borderWidth = 0.2
        button.addTarget(self, action: #selector(buttonRestartFunc), for: .touchUpInside)
        return button
    }()
    private lazy var buttonChange: UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
        button.tintColor = .white
        //        button.layer.borderColor = UIColor.white.cgColor
        //        button.layer.borderWidth = 0.2
        button.addTarget(self, action: #selector(buttonChangeFunc), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var hodLabel: UILabel = {
        let view = UILabel()
        switch currentStep {
        case .crosses:
            view.text = "ход: крестики"
        case .zero:
            view.text = "ход: нолики"
        case .none:
            view.text = "да начнутся голодные игры"
        }
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageCrosses: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "xmark")
        image.tintColor = .white
        return image
    }()
    
    private lazy var imageZero: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "circle.dashed")
        image.tintColor = .white
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        winCrosses()
        swithLabel()
        elseWin()
        buttonRestartFunc()
        
        view.backgroundColor = .black
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate ([
            
            
            imageCrosses.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            imageCrosses.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageCrosses.heightAnchor.constraint(equalToConstant: 52),
            imageCrosses.widthAnchor.constraint(equalToConstant: 52),
            
            scoreLabel.leadingAnchor.constraint(equalTo: imageCrosses.trailingAnchor, constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: imageZero.leadingAnchor, constant: -10),
            scoreLabel.centerYAnchor.constraint(equalTo: imageCrosses.centerYAnchor),
            
            imageZero.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageZero.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            imageZero.heightAnchor.constraint(equalToConstant: 52),
            imageZero.widthAnchor.constraint(equalToConstant: 52),
            
            hodLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hodLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 50),
            
            horisontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horisontalStackView.topAnchor.constraint(equalTo: hodLabel.bottomAnchor, constant: 100),
            
            buttonRestart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonRestart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonRestart.heightAnchor.constraint(equalToConstant: 45),
            buttonRestart.widthAnchor.constraint(equalToConstant: 45),
            
            buttonChange.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonChange.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonChange.heightAnchor.constraint(equalToConstant: 45),
            buttonChange.widthAnchor.constraint(equalToConstant: 45)
            
        ])
    }
    private func setupViews() {
        buttons = [button11, button12, button13,
                   button21, button22, button23, button31, button32, button33]
        
        view.addSubview(imageCrosses)
        view.addSubview(imageZero)
        view.addSubview(scoreLabel)
        view.addSubview(hodLabel)
        view.addSubview(buttonRestart)
        view.addSubview(horisontalStackView)
        view.addSubview(buttonChange)
        horisontalStackView.addArrangedSubview(verticalStackViewOne)
        horisontalStackView.addArrangedSubview(verticalStackViewTwo)
        horisontalStackView.addArrangedSubview(verticalStackViewFree)
        verticalStackViewOne.addArrangedSubview(button11)
        verticalStackViewOne.addArrangedSubview(button12)
        verticalStackViewOne.addArrangedSubview(button13)
        verticalStackViewTwo.addArrangedSubview(button21)
        verticalStackViewTwo.addArrangedSubview(button22)
        verticalStackViewTwo.addArrangedSubview(button23)
        verticalStackViewFree.addArrangedSubview(button31)
        verticalStackViewFree.addArrangedSubview(button32)
        verticalStackViewFree.addArrangedSubview(button33)
        elseWin()
        
        
        scoreLabel.configure(with:  ScoreLabel.ViewModel(crossesScore: crossesScore, zeroScore: zeroScore))
    }
    @objc func buttonTapped(_ sender: ButtonSpace) {
        if data[sender.x-1][sender.y-1] != .none { return }
        switch currentStep {
        case .crosses:
            sender.setImage(UIImage(systemName: "xmark"), for: .normal)
            data[sender.x-1][sender.y-1] = .crosses
            currentStep = .zero
        case .zero:
            sender.setImage(UIImage(systemName:  "circle.dashed"), for: .normal)
            data[sender.x-1][sender.y-1] = .zero
            currentStep = .crosses
        case .none:
            break
        }
        swithLabel()
        winCrosses()
        elseWin()
    }
    func winCrosses() {
        if data[0][0] == data[0][1] && data[0][1] == data[0][2] && data[0][0] != .none {
            hodLabel.text = data[0][0] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[1][0] == data[1][1] && data[1][1] == data[1][2] && data[1][0] != .none {
            hodLabel.text = data[1][0] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[2][0] == data[2][1] && data[2][1] == data[2][2] && data[2][0] != .none {
            hodLabel.text = data[2][0] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[0][0] == data[1][0] && data[1][0] == data[2][0] && data[0][0] != .none {
            hodLabel.text = data[0][0] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[0][1] == data[1][1] && data[1][1] == data[2][1] && data[0][1] != .none {
            hodLabel.text = data[0][1] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[0][2] == data[1][2] && data[0][2] == data[2][2] && data[0][2] != .none {
            hodLabel.text = data[0][2] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[0][0] == data[1][1] && data[1][1] == data[2][2] && data[0][0] != .none {
            hodLabel.text = data[0][0] == .crosses ? "крестики выйграли" : "нолики выйграли"
            
        } else  if data[0][2] == data[1][1] && data[1][1] == data[2][0] && data[2][0] != .none {
            hodLabel.text = data[0][2] == .crosses ? "крестики выйграли" : "нолики выйграли"
        }
    }
   
    func elseWin() {
        if  hodLabel.text == "крестики выйграли" {
            crossesScore += 1
        } else if  hodLabel.text == "нолики выйграли" {
            zeroScore += 1
        }
        scoreLabel.configure(with:  ScoreLabel.ViewModel(crossesScore: crossesScore, zeroScore: zeroScore))
    }
    func swithLabel() {
        switch currentStep {
        case .crosses:
            hodLabel.text = "ход: крестики"
        case .zero:
            hodLabel.text = "ход: нолики"
        case .none:
            hodLabel.text = "да начнутся голодные игры"
        }
    }
    @objc func buttonRestartFunc() {
        data = [
            [.none, .none, .none],
            [.none, .none, .none],
            [.none, .none, .none]
        ]
        buttons.forEach { btn in
            btn.setImage(nil, for: .normal)
        }
        currentStep = .crosses
        swithLabel()

    }
  
    
    
    
    
    
    
    
    
    
    @objc func buttonChangeFunc() {
            var scoreBuffer = crossesScore
            crossesScore = zeroScore
            zeroScore = scoreBuffer
            scoreLabel.configure(with: ScoreLabel.ViewModel(crossesScore: crossesScore, zeroScore: zeroScore))
        
        
    }
}
