//
//  ErrorParser.swift
//  StoreApp
//
//  Created by Федор Филимонов on 13.02.2021.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
