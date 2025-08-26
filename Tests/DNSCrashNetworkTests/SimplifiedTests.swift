//
//  SimplifiedTests.swift
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

final class SimplifiedDNSCrashNetworkTests: XCTestCase, @unchecked Sendable {
    
    func testCodeLocationCreation() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        XCTAssertNotNil(codeLocation)
        XCTAssertEqual(DNSCrashNetworkCodeLocation.domainPreface, "com.doublenode.crashNetwork.")
    }
    
    func testCodeLocationTypealias() {
        let typealiasType = DNSCodeLocation.crashNetwork.self
        let directType = DNSCrashNetworkCodeLocation.self
        XCTAssertTrue(typealiasType == directType)
    }
    
    func testNETCrashConfigCreation() {
        let config: any NETPTCLConfig = NETCrashConfig()
        XCTAssertNotNil(config)
        XCTAssertTrue(config is NETBlankConfig)
    }
    
    func testNETCrashRouterCreation() {
        let router: any NETPTCLRouter = NETCrashRouter()
        XCTAssertNotNil(router)
        XCTAssertTrue(router is NETBlankRouter)
    }
    
    func testNETCrashRouterWithConfig() {
        let config = NETCrashConfig()
        let router: any NETPTCLRouter = NETCrashRouter(with: config)
        XCTAssertNotNil(router)
        XCTAssertTrue(router is NETBlankRouter)
    }
    
    func testErrorCreation() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let error = DNSError.NetworkBase.notImplemented(
            transactionId: "test123",
            .crashNetwork(codeLocation)
        )
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.errorString.contains("Not Implemented"))
    }
    
    func testMultipleInstanceCreation() {
        let config1 = NETCrashConfig()
        let config2 = NETCrashConfig()
        let router1 = NETCrashRouter()
        let router2 = NETCrashRouter()
        let location1 = DNSCrashNetworkCodeLocation(self)
        let location2 = DNSCrashNetworkCodeLocation(self)
        
        XCTAssertNotNil(config1)
        XCTAssertNotNil(config2)
        XCTAssertNotNil(router1)
        XCTAssertNotNil(router2)
        XCTAssertNotNil(location1)
        XCTAssertNotNil(location2)
        
        // Verify they are different instances
        XCTAssertFalse(config1 === config2)
        XCTAssertFalse(router1 === router2)
        XCTAssertFalse(location1 === location2)
    }
    
    func testTypeCompatibility() {
        let config: any NETPTCLConfig = NETCrashConfig()
        let router: any NETPTCLRouter = NETCrashRouter()
        let codeLocation: DNSCodeLocation = DNSCrashNetworkCodeLocation(self)
        
        XCTAssertTrue(config is NETCrashConfig)
        XCTAssertTrue(router is NETCrashRouter)  
        XCTAssertTrue(codeLocation is DNSCrashNetworkCodeLocation)
    }
    
    func testCrashNetworkDesignValidation() {
        // This package is designed to provide "crash" implementations
        // that fail when called. This test validates the components exist
        // and can be instantiated, but doesn't call the failing methods.
        let config: any NETPTCLConfig = NETCrashConfig()
        let router: any NETPTCLRouter = NETCrashRouter(with: NETCrashConfig())
        let codeLocation: DNSCodeLocation = DNSCrashNetworkCodeLocation(self)
        
        XCTAssertNotNil(config)
        XCTAssertNotNil(router)
        XCTAssertNotNil(codeLocation)
        
        // Validate inheritance hierarchy
        XCTAssertTrue(config is NETBlankConfig)
        XCTAssertTrue(router is NETBlankRouter)
        XCTAssertTrue(codeLocation is DNSCrashNetworkCodeLocation)
    }
}
