//
//  UserData.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/19.
//

import Foundation

class UserData: ObservableObject {
    // ユーザ名
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }

    //メールアドレス
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    
    //パスワード
    @Published var password: String {
        didSet {
            UserDefaults.standard.set(password, forKey: "password")
        }
    }
    
    //単語
    @Published var wordArray: [String] {
        didSet {
            UserDefaults.standard.set(wordArray, forKey: "wordArray")
        }
    }
    // 初期化処理
    init() {
        username = UserDefaults.standard.string(forKey: "username") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        password = UserDefaults.standard.string(forKey: "password") ?? ""
        wordArray = UserDefaults.standard.array(forKey: "wordArray") as? [String] ?? []
        
    }
}
