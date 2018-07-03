//
//  Protocols.swift
//  SWAPP
//
//  Created by Danilo Bias on 16/03/18.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import Foundation

protocol InitializerProtocol: class{
    init()
}

protocol Countable: class{
    func numberOfRows() -> Int
}

protocol RequestElement: class{
    func getElement(firstPage: Bool, completion: @escaping(Error?) -> Void)
}

protocol RequestElementURL: class{
    func getElement(withURL url: String, completion: @escaping(Error?) -> Void)
}


protocol SingleElement: InitializerProtocol, RequestElementURL{
    
}

protocol ListProtocol: InitializerProtocol, Countable, RequestElement{
    
}

protocol ListParamURLProtocol: InitializerProtocol, Countable, RequestElementURL{
    
}
