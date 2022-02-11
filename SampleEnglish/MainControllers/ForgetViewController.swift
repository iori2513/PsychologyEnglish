//
//  ForgetViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/01/08.
//

import UIKit
import Firebase

class ForgetViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction private func didTapSendButton() {
        let email = emailTextField.text ?? ""
            
            Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
                guard let self = self else { return }
                if error == nil {
                    let alert = UIAlertController(title: "確認", message: "メッセージを送信しました", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true, completion: nil)
                    
                }
                self.showErrorIfNeeded(error)
            }
        
    }
    
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let error = errorOrNil else { return }

        let message = "エラーが起きました"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        emailTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
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
