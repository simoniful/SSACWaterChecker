//
//  ProfileViewController.swift
//  SSACWaterChecker
//
//  Created by Sang hun Lee on 2021/10/11.
//

import UIKit
import TextFieldEffects

class ProfileViewController: UIViewController {
    @IBOutlet var nicknameTextField: HoshiTextField!
    @IBOutlet var heightTextField: HoshiTextField!
    @IBOutlet var weightTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveUserInfo(_ sender: UIButton) {
        let nickname = nicknameTextField.text ?? "익명 사용자"
        let height = heightTextField.text ?? "160"
        let weight = weightTextField.text ?? "50"
        UserDefaults.standard.set(nickname, forKey: "nickname")
        UserDefaults.standard.set(height, forKey: "height")
        UserDefaults.standard.set(weight, forKey: "weight")
        nicknameTextField.text = nil
        heightTextField.text = nil
        weightTextField.text = nil
    }
    
}
