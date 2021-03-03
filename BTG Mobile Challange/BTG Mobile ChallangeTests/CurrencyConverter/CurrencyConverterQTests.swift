//
//  CurrencyConverterQTests.swift
//  BTG Mobile ChallangeTests
//
//  Created by Uriel Barbosa Pinheiro on 02/03/21.
//  Copyright © 2021 Uriel Barbosa Pinheiro. All rights reserved.
//

@testable import BTG_Mobile_Challange
import Quick
import Nimble

class CurrencyConverterQTests: QuickSpec {
    private var mock = CurrencyConverterServiceMock()
    private var sut: CurrencyConverterViewModel?

    override func spec() {

        beforeEach {
            self.sut = CurrencyConverterViewModel(servicesProvider: self.mock)
        }

        context("initial") {
            it("value is nil") {
                expect(self.sut?.convertedValue).to(beNil())
            }
        }

        context("convert valid currency") {
            it("value is not nil") {
                self.sut?.convert(from: "BRL", to: "USD", value: 100)
                expect(self.sut?.convertedValue).toEventuallyNot(beNil())
            }
        }
    }
}
