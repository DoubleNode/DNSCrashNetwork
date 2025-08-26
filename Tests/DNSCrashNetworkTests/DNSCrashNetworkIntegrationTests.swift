//
//  DNSCrashNetworkIntegrationTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetworkTests
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
import DNSError
import DNSProtocols
import DNSBlankNetwork
import Foundation
@testable import DNSCrashNetwork

final class DNSCrashNetworkIntegrationSpecificTests: XCTestCase, @unchecked Sendable {
    
    func testFullCrashNetworkStackInitialization() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let config = NETCrashConfig()
        let router = NETCrashRouter(with: config)
        
        XCTAssertNotNil(codeLocation)
        XCTAssertNotNil(config)
        XCTAssertNotNil(router)
        
        XCTAssertTrue(codeLocation is DNSCodeLocation)
        XCTAssertTrue(config is NETBlankConfig)
        XCTAssertTrue(router is NETBlankRouter)
    }
    
    func testCrashBehaviorIsConsistent() {
        let config = NETCrashConfig()
        let router = NETCrashRouter()
        let url = URL(string: "https://api.example.com/test")!
        
        let expectation1 = XCTestExpectation(description: "Config crashes")
        let expectation2 = XCTestExpectation(description: "Router crashes")
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected config to crash") {
                _ = config.urlRequest(using: url)
            }
            expectation1.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("Expected router to crash") {
                _ = router.urlRequest(using: url)
            }
            expectation2.fulfill()
        }
        
        wait(for: [expectation1, expectation2], timeout: 3.0)
    }
    
    func testErrorMessageConsistency() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let transactionId = UUID().uuidString
        
        let error1 = DNSError.NetworkBase.notImplemented(
            transactionId: transactionId,
            .crashNetwork(codeLocation)
        )
        
        let error2 = DNSError.NetworkBase.notImplemented(
            transactionId: transactionId,
            .crashNetwork(codeLocation)
        )
        
        XCTAssertEqual(error1.errorString, error2.errorString)
    }
    
    func testConcurrentAccess() {
        let config = NETCrashConfig()
        let router = NETCrashRouter(with: config)
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        
        let expectationGroup = DispatchGroup()
        let concurrentQueue = DispatchQueue.global(qos: .userInitiated)
        
        for i in 0..<10 {
            expectationGroup.enter()
            concurrentQueue.async {
                let localConfig = NETCrashConfig()
                let localRouter = NETCrashRouter()
                let localCodeLocation = DNSCrashNetworkCodeLocation(self)
                
                XCTAssertNotNil(localConfig)
                XCTAssertNotNil(localRouter)
                XCTAssertNotNil(localCodeLocation)
                
                expectationGroup.leave()
            }
        }
        
        let expectation = XCTestExpectation(description: "Concurrent access completed")
        expectationGroup.notify(queue: .main) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testMemoryManagement() {
        weak var weakConfig: NETCrashConfig?
        weak var weakRouter: NETCrashRouter?
        weak var weakCodeLocation: DNSCrashNetworkCodeLocation?
        
        autoreleasepool {
            let config = NETCrashConfig()
            let router = NETCrashRouter(with: config)
            let codeLocation = DNSCrashNetworkCodeLocation(self)
            
            weakConfig = config
            weakRouter = router
            weakCodeLocation = codeLocation
            
            XCTAssertNotNil(weakConfig)
            XCTAssertNotNil(weakRouter)
            XCTAssertNotNil(weakCodeLocation)
        }
        
        XCTAssertNil(weakConfig)
        XCTAssertNil(weakRouter)
        XCTAssertNil(weakCodeLocation)
    }
    
    func testTypeCompatibility() {
        let config: any NETPTCLConfig = NETCrashConfig()
        let router: any NETPTCLRouter = NETCrashRouter()
        let codeLocation: DNSCodeLocation = DNSCrashNetworkCodeLocation(self)
        
        XCTAssertNotNil(config)
        XCTAssertNotNil(router)
        XCTAssertNotNil(codeLocation)
        
        XCTAssertTrue(config is NETCrashConfig)
        XCTAssertTrue(router is NETCrashRouter)
        XCTAssertTrue(codeLocation is DNSCrashNetworkCodeLocation)
    }
    
    func testCrashNetworkPurpose() {
        let config = NETCrashConfig()
        let router = NETCrashRouter()
        
        let expectation1 = XCTestExpectation(description: "Config designed to fail")
        let expectation2 = XCTestExpectation(description: "Router designed to fail")
        
        DispatchQueue.global().async {
            XCTExpectFailure("CrashNetwork is designed to fail") {
                _ = config.urlComponents()
            }
            expectation1.fulfill()
        }
        
        DispatchQueue.global().async {
            XCTExpectFailure("CrashNetwork is designed to fail") {
                _ = router.urlRequest(using: URL(string: "https://test.com")!)
            }
            expectation2.fulfill()
        }
        
        wait(for: [expectation1, expectation2], timeout: 3.0)
    }
}