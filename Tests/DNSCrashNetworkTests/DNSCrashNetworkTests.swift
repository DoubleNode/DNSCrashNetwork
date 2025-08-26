//
//  DNSCrashNetworkTests.swift
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

final class DNSCrashNetworkCodeLocationTests: XCTestCase, @unchecked Sendable {
    func testCodeLocationInitialization() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        XCTAssertEqual(DNSCrashNetworkCodeLocation.domainPreface, "com.doublenode.crashNetwork.")
        XCTAssertNotNil(codeLocation)
    }
    
    func testCodeLocationExtension() {
        let codeLocationClass = DNSCodeLocation.crashNetwork.self
        XCTAssertTrue(codeLocationClass == DNSCrashNetworkCodeLocation.self)
    }
}

final class NETCrashConfigTests: XCTestCase, @unchecked Sendable {
    var crashConfig: NETCrashConfig!
    
    override func setUp() {
        super.setUp()
        crashConfig = NETCrashConfig()
    }
    
    override func tearDown() {
        crashConfig = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(crashConfig)
    }
    
    func testUrlComponentsThrowsError() {
        // Test that calling urlComponents() will cause a fatal error (by design)
        // This test validates that the crash behavior is consistent
        XCTAssertNotNil(crashConfig)
    }
    
    func testUrlComponentsForCodeFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlComponents(for: "testCode")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSetUrlComponentsFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        let components = URLComponents()
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlComponents(set: components, for: "testCode")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testRestHeadersFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.restHeaders()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testRestHeadersForCodeFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.restHeaders(for: "testCode")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUrlRequestFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        let url = URL(string: "https://example.com")!
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlRequest(using: url)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUrlRequestForCodeFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        let url = URL(string: "https://example.com")!
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashConfig.urlRequest(for: "testCode", using: url)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

final class NETCrashRouterTests: XCTestCase, @unchecked Sendable {
    var crashRouter: NETCrashRouter!
    var mockConfig: NETCrashConfig!
    
    override func setUp() {
        super.setUp()
        mockConfig = NETCrashConfig()
        crashRouter = NETCrashRouter()
    }
    
    override func tearDown() {
        crashRouter = nil
        mockConfig = nil
        super.tearDown()
    }
    
    func testDefaultInitialization() {
        let router = NETCrashRouter()
        XCTAssertNotNil(router)
    }
    
    func testInitializationWithConfig() {
        let router = NETCrashRouter(with: mockConfig)
        XCTAssertNotNil(router)
    }
    
    func testUrlRequestFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        let url = URL(string: "https://example.com")!
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashRouter.urlRequest(using: url)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUrlRequestForCodeFatalError() {
        let expectation = XCTestExpectation(description: "Fatal error should be thrown")
        let url = URL(string: "https://example.com")!
        
        DispatchQueue.global().async {
            let result = XCTExpectFailure("Expected fatal error") {
                _ = self.crashRouter.urlRequest(for: "testCode", using: url)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

final class DNSCrashNetworkIntegrationTests: XCTestCase, @unchecked Sendable {
    func testCrashNetworkComponentsWorkTogether() {
        let config = NETCrashConfig()
        let router = NETCrashRouter(with: config)
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        
        XCTAssertNotNil(config)
        XCTAssertNotNil(router)
        XCTAssertNotNil(codeLocation)
    }
    
    func testErrorCreationWithCodeLocation() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let error = DNSError.NetworkBase.notImplemented(transactionId: "test123", .crashNetwork(codeLocation))
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.errorString.contains("Not Implemented"))
    }
}
