//
//  LoginViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2021/10/17.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // Resisterボタンを押したときの処理
    @IBAction private func didTapSignUpButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let name = usernameTextField.text ?? ""
        
        
        
        signUp(email: email, password: password, name: name)
        UserData().username = name
        UserData().email = email
        UserData().password = password
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        //ナビゲーションバーを表示する
        navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view.
    }
    
    // エラー表示
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let error = errorOrNil else { return }

        let message = "エラーが起きました"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // 新規登録
    private func signUp(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] result, error in
            guard let self = self else { return }
            
            if let user = result?.user {
                self.updateDisplayName(name, of: user)
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
            self.showErrorIfNeeded(error)
        }
    }

    
    private func updateDisplayName(_ name: String, of user: User) {
        let request = user.createProfileChangeRequest()
        request.displayName = name
        request.commitChanges() { [weak self] error in
            guard let self = self else { return }
            if error == nil {
                self.sendEmailVerification(to: user)
            }
            self.showErrorIfNeeded(error)
        }
    }

    private func sendEmailVerification(to user: User) {
        user.sendEmailVerification() { [weak self] error in
            guard let self = self else { return }
            if error != nil {
                self.showSignUpCompletion()
            }
            self.showErrorIfNeeded(error)
        }
    }

    private func showSignUpCompletion() {
        // 完了したことを表示する
    }
    
    
    // Enterを押したらキーボードが閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    */

}
