//
//  MainMenyViewController.swift
//  SevenWondersStatTracker
//
//  Created by Nikola Blagoevski on 8.7.22.
//

import Foundation
import SnapKit
import UIKit

class MainMenuViewController: UIViewController {
    
    lazy var sevenWonderslogoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "7WondersLogo2")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var myGamesButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Gamess", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Game", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showUserSelectionController), for: .touchUpInside)
        return button
    }()
    
    lazy var highScoresButton: UIButton = {
        let button = UIButton()
        button.setTitle("High Scores", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ myGamesButton, newGameButton, highScoresButton])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    lazy var mainMenuStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ UIView(), sevenWonderslogoView, labelStackView, UIView()])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        stack.alignment = .center
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainMenuStackView)
        
        mainMenuStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    
        sevenWonderslogoView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(450)
            make.height.equalTo(150)
//            make.leading.trailing.equalTo(100)
//            make.top.bottom.equalTo(100)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.width.equalTo(sevenWonderslogoView.snp.width).inset(20)
        }
    }
    
    @objc func showUserSelectionController() {
        let dataManager = DatabaseManager()
        let userSelectionController = UserSelectionViewController(dataManager: dataManager)
        present(userSelectionController, animated: true, completion: nil)
    }
    
    func showHighScores() {
        //button high scores opens new high scores controller
    }
    
    func showMyGames() {
        //button my Games open new controller that shows current user games
    }
}
