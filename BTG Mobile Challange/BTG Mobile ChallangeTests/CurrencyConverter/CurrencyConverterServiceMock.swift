//
//  CurrencyConverterServiceMock.swift
//  BTG Mobile ChallangeTests
//
//  Created by Uriel Barbosa Pinheiro on 22/02/21.
//  Copyright © 2021 Uriel Barbosa Pinheiro. All rights reserved.
//

@testable import BTG_Mobile_Challange
import Foundation

class CurrencyConverterServiceMock: BaseServiceMock, CurrencyConverterServiceProtocol {
    func fetchCurrencyQuotes(completion: @escaping CurrencyConverterServiceCallback) {
        return JSONReader.read(fileName, completion: completion)
    }
}
