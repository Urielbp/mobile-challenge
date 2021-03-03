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
            self.mock.fileName = "200-response"
            self.sut = CurrencyConverterViewModel(servicesProvider: self.mock)
        }

        afterEach {
            self.sut?.convertedValue = nil
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

        context("convert invalid currency") {
            it("value is nil") {
                self.sut?.convert(from: "BRL", to: "BANANA", value: 100)
                expect(self.sut?.convertedValue).to(beNil())
            }
        }

        context("convert invalid response") {

            beforeEach {
                self.mock.fileName = "400-invalid"
                self.sut = CurrencyConverterViewModel(servicesProvider: self.mock)
            }

            it("value is nil") {
                self.sut?.convert(from: "BRL", to: "BANANA", value: 100)
                expect(self.sut?.convertedValue).to(beNil())
            }
        }
    }
}
