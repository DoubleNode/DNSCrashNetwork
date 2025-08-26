//
//  NETCrashConfigTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetworkTests
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
import DNSError
import DNSProtocols
import DNSBlankNetwork
@testable import DNSCrashNetwork

final class NETCrashConfigSpecificTests: XCTestCase, @unchecked Sendable {
    var crashConfig: NETCrashConfig!
    
    override func setUp() {
        super.setUp()
        crashConfig = NETCrashConfig()
    }
    
    override func tearDown() {
        crashConfig = nil
        super.tearDown()
    }
    
    func testInheritsFromNETBlankConfig() {
        XCTAssertTrue(crashConfig is NETBlankConfig)
    }
    
    func testRequiredInitializerExists() {
        let config = NETCrashConfig()
        XCTAssertNotNil(config)
    }
    
    func testAllMethodsThrowNotImplementedError() {
        let expectation1 = XCTestExpectation(description: "urlComponents throws")
        let expectation2 = XCTestExpectation(description: "urlComponents(for:) throws")
        let expectation3 = XCTestExpectation(description: "urlComponents(set:for:) throws")
        let expectation4 = XCTestExpectation(description: "restHeaders throws")
        let expectation5 = XCTestExpectation(description: "restHeaders(for:) throws")
        let expectation6 = XCTestExpectation(description: "urlRequest(using:) throws")
        let expectation7 = XCTestExpectation(description: "urlRequest(for:using:) throws")
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlComponents()
            }
            expectation1.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlComponents(for: "test")
            }
            expectation2.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlComponents(set: URLComponents(), for: "test")
            }
            expectation3.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.restHeaders()
            }
            expectation4.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.restHeaders(for: "test")
            }
            expectation5.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlRequest(using: URL(string: "https://test.com")!)
            }
            expectation6.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlRequest(for: "test", using: URL(string: "https://test.com")!)
            }
            expectation7.fulfill()
        }
        
        wait(for: [expectation1, expectation2, expectation3, expectation4, expectation5, expectation6, expectation7], timeout: 5.0)
    }
    
    func testErrorMessagesContainCorrectInformation() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let error = DNSError.NetworkBase.notImplemented(transactionId: "test123", .crashNetwork(codeLocation))
        
        XCTAssertTrue(error.errorString.contains("notImplemented"))
    }
}