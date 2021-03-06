//
//  LoginViewController.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginPanelView: UIView!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configUIComponents()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleLoginFinished), name: NSNotification.Name(rawValue: requsetStoreDataCompleteNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: requsetStoreDataCompleteNotification), object: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configUIComponents (){
        loginPanelView.backgroundColor = appThemeColor
        
        usernameTextField.text = "6049315255"
        usernameTextField.placeholder = NSLocalizedString("username", comment: "")
        usernameTextField.delegate = self
        
        passwordTextField.text = "gp6049315255"
        passwordTextField.placeholder = NSLocalizedString("password", comment: "")
        passwordTextField.delegate = self
        
        loginButton.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        loginButton.setTitleColor(.darkGray, for: .normal)
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.cornerRadius = defaultButtonCornerRadius
        
        registerButton.setTitle(NSLocalizedString("start new business", comment: ""), for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.borderWidth = 0.5
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.cornerRadius = defaultButtonCornerRadius
        
        forgetPasswordButton.setTitle(NSLocalizedString("forget password ?", comment: ""), for: .normal)
        forgetPasswordButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if let username = usernameTextField.text,
            let password = passwordTextField.text {
            
            //show loading box
            BasicLaodingView.shared.showProgressView(view)
            
            DispatchQueue.global().async {
                AccountManager.shared.login(username: username, password: password) {
                    isSuccess in
                    
                    if !isSuccess {
                        BasicLaodingView.shared.hideProgressView()
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func handleLoginFinished () {
        BasicLaodingView.shared.hideProgressView()
        performSegue(withIdentifier: "to_sw", sender: nil)
    }
}

