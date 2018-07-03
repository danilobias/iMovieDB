//
//  ErrorManager.swift
//  SWAPP
//
//  Created by Danilo Bias on 15/03/18.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

struct ErrorManager {
    static func error(type: ErrorType) -> NSError {
        switch type {
        case .unknown:
            return NSError(domain: "Não foi possível acessar no momento.", code: 404, userInfo: nil)
        case .alamofire:
            return NSError(domain: "Erro na requisição...", code: 430, userInfo: nil)
        }
    }
}
