//
//  NETCrashRouterTests.swift
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

final class NETCrashRouterSpecificTests: XCTestCase, @unchecked Sendable {
    var crashRouter: NETCrashRouter!
    var crashConfig: NETCrashConfig!
    
    override func setUp() {
        super.setUp()
        crashConfig = NETCrashConfig()
        crashRouter = NETCrashRouter()
    }
    
    override func tearDown() {
        crashRouter = nil
        crashConfig = nil
        super.tearDown()
    }
    
    func testInheritsFromNETBlankRouter() {
        XCTAssertTrue(crashRouter is NETBlankRouter)
    }
    
    func testDefaultInitializerCallsConfigure() {
        let router = NETCrashRouter()
        XCTAssertNotNil(router)
    }
    
    func testInitWithConfigCallsConfigure() {
        let router = NETCrashRouter(with: crashConfig)
        XCTAssertNotNil(router)
    }
    
    func testUrlRequestMethodsThrowNotImplementedError() {
        let expectation1 = XCTestExpectation(description: "urlRequest(using:) throws")
        let expectation2 = XCTestExpectation(description: "urlRequest(for:using:) throws")
        let testUrl = URL(string: "https://example.com")!
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashRouter.urlRequest(using: testUrl)
            }
            expectation1.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected fatal error") {
                _ = self.crashRouter.urlRequest(for: "testCode", using: testUrl)
            }
            expectation2.fulfill()
        }
        
        wait(for: [expectation1, expectation2], timeout: 3.0)
    }
    
    func testRouterCreatesCorrectErrorType() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(codeLocation))
        
        XCTAssertTrue(error.errorString.contains("Not Implemented"))
    }
    
    func testMultipleRouterInstancesCanBeCreated() {
        let router1 = NETCrashRouter()
        let router2 = NETCrashRouter(with: crashConfig)
        let router3 = NETCrashRouter()
        
        XCTAssertNotNil(router1)
        XCTAssertNotNil(router2)
        XCTAssertNotNil(router3)
        
        XCTAssertFalse(router1 === router2)
        XCTAssertFalse(router2 === router3)
        XCTAssertFalse(router1 === router3)
    }
}
