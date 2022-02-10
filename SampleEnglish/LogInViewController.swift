//
//  LogInViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/04.
//

import UIKit
import Firebase

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction private func didTapLogInButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let user = result?.user {
                //パスワードがあっていたらログインし、画面遷移する
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
            self.showErrorIfNeeded(error)
        }
    }
    
    // エラーが起きた時に行う処理
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        guard let error = errorOrNil else { return }
        
        let message = errorMessage(of: error) // エラーメッセージを取得
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // エラーメッセージを表示
    private func errorMessage(of error: Error) -> String {
        var message = "エラーが発生しました"
        guard let errcd = AuthErrorCode(rawValue: (error as NSError).code) else {
            return message
        }
        
        switch errcd {
        case .networkError: message = "ネットワークに接続できません"
        case .userNotFound: message = "ユーザが見つかりません"
        case .invalidEmail: message = "不正なメールアドレスです"
        case .emailAlreadyInUse: message = "このメールアドレスは既に使われています"
        case .wrongPassword: message = "パスワードが違います"
        case .userDisabled: message = "このアカウントは無効です"
        case .weakPassword: message = "パスワードが脆弱すぎます"
        // これは一例です。必要に応じて増減させてください
        default: break
        }
        return message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // エンター押したらキーボードを閉じる
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
    }
    */

}
