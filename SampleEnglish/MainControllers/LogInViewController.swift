//
//  LogInViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/04.
//

import UIKit
import Firebase
import LocalAuthentication

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //ログインボタンを押した際の処理
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
        default: break
        }
        return message
    }
    
    //指紋認証(顔認証)を行う処理
    func allowFaceID() {
        let context = LAContext()
        var error: NSError?
        var description: String = "認証"

        // Touch ID・Face IDが利用できるデバイスか確認する
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 利用できる場合は指紋・顔認証を要求する
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description, reply: {success, evaluateError in
                if (success) {
                    // 認証成功時に画面を遷移する
                    DispatchQueue.main.async {
                      self.performSegue(withIdentifier: "toHome",sender: nil)
                    }
                    

                    
                    print("認証成功")
                } else {
                    // 認証失敗時の処理を書く
                    print("認証失敗")
                }
            })
        } else {
            // Touch ID・Face IDが利用できない場合の処理
            let errorDescription = error?.userInfo["NSLocalizedDescription"] ?? ""
            print(errorDescription) // Biometry is not available on this device.
        }
        switch context.biometryType {
        case .faceID: // Xcode 9.2 以上は .faceID
            description = "アカウント情報を閲覧するためにFace IDを認証として用います。"
            break
        case .touchID: // Xcode 9.2 以上は .touchID
            description = "アカウント情報を閲覧するためにTouch IDを認証として用います。"
            break
        case .none:
            description = "アカウント情報を閲覧するためにログインしてください。"
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //新規登録済みであれば指紋認証（顔認証）を行う
        if UserData().password != "" && UserData().email != "" && UserData().username != "" {
            allowFaceID()
            print(11)
        }

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
