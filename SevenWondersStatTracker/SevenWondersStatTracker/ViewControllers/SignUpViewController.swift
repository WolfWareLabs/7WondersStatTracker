//
//  SignUpViewController.swift
//  SevenWondersStatTracker
//
//  Created by Nikola Blagoevski on 13.10.22.
//

import Foundation
import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(stackView)
        view.bringSubviewToFront(stackView)
        
        stackView.snp.makeConstraints { make in
            make.width.equalTo(view.frame.size.width * 0.3)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.frame.maxY * 0.7)
        }
        
//        signUpButton.snp.makeConstraints { make in
//            make.width.equalTo(50)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        emailTextField.becomeFirstResponder()
    }
    
    lazy var emailTextField : UITextField = {
        let email = UITextField()
        email.placeholder = "Email address"
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor.black.cgColor
        email.backgroundColor = .white
        email.layer.cornerRadius = 5
        email.textContentType = .emailAddress
        email.autocorrectionType = .no
        return email
    }()
    
    lazy var passwordTextField : UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
        password.isSecureTextEntry = true
        password.textContentType = .password
        password.backgroundColor = .white
        password.layer.cornerRadius = 5
        password.autocorrectionType = .no
        return password
    }()
    
    lazy var confirmPasswordTextField : UITextField = {
        let confirmPass = UITextField()
        confirmPass.placeholder = "Confirm password"
        confirmPass.layer.borderWidth = 1
        confirmPass.layer.borderColor = UIColor.black.cgColor
        confirmPass.isSecureTextEntry = true
        confirmPass.textContentType = .password
        confirmPass.backgroundColor = .white
        confirmPass.layer.cornerRadius = 5
        confirmPass.autocorrectionType = .no
        return confirmPass
    }()
    
    lazy var signUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    @objc private func signUp(){
        print("tapped")
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
            guard error == nil else {
                // cannot sign in
                return
            }
        })
    }
    
    lazy var signUpStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, confirmPasswordTextField ])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.backgroundColor = .clear
        stack.isLayoutMarginsRelativeArrangement = true
//        stack.directionalLayoutMargins.top = 200
//        stack.directionalLayoutMargins.leading = 200
//        stack.directionalLayoutMargins.trailing = 200
//        stack.directionalLayoutMargins.bottom = 20
        return stack
    }()
    
    lazy var buttonStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signUpButton, UIView()])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
//        stack.spacing = 10
        stack.backgroundColor = .clear
//        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var stackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signUpStackView, buttonStackView])
        stack.axis = .vertical
        stack.alignment = .fill
        //stack.distribution = .fillEqually
        stack.spacing = 10
        stack.backgroundColor = .clear
//        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var backgroundImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background_image")
        return image
    }()
}
