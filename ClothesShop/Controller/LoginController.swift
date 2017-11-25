//
//  LoginController.swift
//  ClothesShop
//
//  Created by ngovantucuong on 11/18/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FBSDKLoginKit

class LoginController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var logoShop: UIImageViewX!
    @IBOutlet weak var email: UITextFieldX!
    @IBOutlet weak var password: UITextFieldX!
    
    @IBOutlet weak var SignIn: GIDSignInButton!
    @IBOutlet weak var SignInFace: UIButtonX!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        GIDSignIn.sharedInstance().uiDelegate = self
        //SignInFace.delegate = self
        
        SignIn.addTarget(self, action: #selector(handleSignInGmail), for: .touchUpInside)
        SignInFace.addTarget(self, action: #selector(handleSignInFacebook), for: .touchUpInside)
    }

    private func setupLayout() {
        logoShop.backgroundColor = UIColor.white
        logoShop.layer.cornerRadius = 50
        logoShop.layer.masksToBounds = true
        
        email.layer.cornerRadius = 20
        email.layer.masksToBounds = true
        
        password.layer.cornerRadius = 20
        password.layer.masksToBounds = true
        password.isSecureTextEntry = true
    }
    
    @IBAction func handleLogin(_ sender: Any) {
        if email.text == "" || password.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please input email and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else {
            guard let email = email.text, let password = password.text else {
                return
            }
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeController") {
                    self.navigationController?.pushViewController(viewController, animated: true)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc func handleSignInFacebook() {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if error != nil {
                print("Failed to login:  \(error!.localizedDescription)")
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    let alertController = UIAlertController(title: "Login error", message: error.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(action)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                
                let databaseRef = Database.database().reference()
                guard let uid = user?.uid else {  return }
                databaseRef.child("user-profiles").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    let snapshot = snapshot.value as? NSDictionary
                    if snapshot == nil {
                        databaseRef.child("user-profiles").child(uid).child("name").setValue(user?.displayName)
                        databaseRef.child("user-profiles").child(uid).child("email").setValue(user?.email)
                    }
                    
                    if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeController") {
                        UIApplication.shared.keyWindow?.rootViewController = viewController
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            })
        }
    }
    
    @objc func handleSignInGmail() {
        GIDSignIn.sharedInstance().signIn()
    }

}
