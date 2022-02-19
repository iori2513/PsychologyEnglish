//
//  UserData.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/19.
//

import Foundation

class UserData: ObservableObject {
    /// ユーザ名
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    /// 初期化処理
    init() {
        username = UserDefaults.standard.string(forKey: "username") ?? ""
    }
}
