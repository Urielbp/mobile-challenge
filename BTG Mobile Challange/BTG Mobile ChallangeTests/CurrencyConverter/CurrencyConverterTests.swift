//
//  CurrencyConverterTests.swift
//  BTG Mobile ChallangeTests
//
//  Created by Uriel Barbosa Pinheiro on 02/03/21.
//  Copyright © 2021 Uriel Barbosa Pinheiro. All rights reserved.
//

import XCTest
@testable import BTG_Mobile_Challange

class CurrencyConverterTests: XCTestCase {

    private var mock: CurrencyConverterServiceMock?
    private var sut: CurrencyConverterViewModel?

    override func setUp() {
        mock = CurrencyConverterServiceMock()
        guard let mock = mock else {
            XCTFail("failed to load mock file")
            return
        }
        sut = CurrencyConverterViewModel(servicesProvider: mock)
    }
//
//    func testConvertedValueIsInitiallNil() {
//        XCTAssertNil(sut?.convertedValue)
//    }
//
//    func testConvertValidCurrency() {
//        XCTAssertNil(sut?.convertedValue)
//        sut?.convert(from: "BRL", to: "USD", value: 100)
//        XCTAssertNotNil(sut?.convertedValue)
//    }
//
//    func testConvertInvalidCurrency() {
//        XCTAssertNil(sut?.convertedValue)
//        sut?.convert(from: "BRL", to: "BANANA", value: 100)
//        XCTAssertNil(sut?.convertedValue)
//    }

    func testConvertInvalidResponse() {
        XCTAssertNil(sut?.convertedValue)
        mock?.fileName = "400-invalid"
        sut?.convert(from: "BRL", to: "BANANA", value: 100)
        XCTAssertNil(sut?.convertedValue)
    }

}
