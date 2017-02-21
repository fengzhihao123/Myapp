//
//  LoginAPI.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/21.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import Moya

enum LoginAPI {
    case login(userTel: String,userPassword: String)
    case register(userTel: String,userPassword: String)
}

extension LoginAPI: TargetType {
    var baseURL: URL { return URL(string: "http://127.0.0.1:8080/v1/")! }
    var path: String {
        switch self {
        case .login(userTel: _, userPassword: _):
            return "login"
        case .register(userTel: _, userPassword: _):
            return "register"
        }
    }
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .login(let userTel, let userPassword):
            return ["userTel": userTel,"userPassword": userPassword]
        case .register(let userTel, let userPassword):
            return ["userTel": userTel,"userPassword": userPassword]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .login, .register:
            return JSONEncoding.default // Send parameters as JSON in request body
        }
    }
    var sampleData: Data {
        switch self {
        case .login(let userTel,let userPassword):
            return "{\"userTel\": \"\(userTel)\", \"userPassword\": \"\(userPassword)\"}".utf8Encoded
        case .register(let userTel,let userPassword):
            return "{\"userTel\": \"\(userTel)\", \"userPassword\": \"\(userPassword)\"}".utf8Encoded
        }
    }
    var task: Task {
        switch self {
        case .login,.register :
            return .request
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
