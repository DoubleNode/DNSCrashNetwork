//
//  DNSCrashNetworkMinimalTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetworkTests
//
//  MINIMAL TESTS FOR COMPILATION VERIFICATION
//  Use with Package.minimal.swift configuration
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
import DNSError
@testable import DNSCrashNetwork

final class DNSCrashNetworkMinimalTests: XCTestCase {

    // MARK: - Basic Compilation Tests -

    func test_dnscrashnetwork_imports_should_compile() {
        // This test ensures the main DNSCrashNetwork.swift file compiles
        // and imports are accessible without UIKit dependencies
        XCTAssertNotNil(Foundation.Bundle.main)
        XCTAssertNotNil(DNSError.self)
    }

    func test_crashconfig_instantiation_should_work() {
        // Test that NETCrashConfig can be instantiated
        let config = NETCrashConfig()
        XCTAssertNotNil(config)
        XCTAssertTrue(config is NETCrashConfig)
    }

    func test_crashrouter_instantiation_should_work() {
        // Test that NETCrashRouter can be instantiated
        let router = NETCrashRouter()
        XCTAssertNotNil(router)
        XCTAssertTrue(router is NETCrashRouter)
    }

    func test_crashnetworkcodelocation_should_work() {
        // Test that DNSCrashNetworkCodeLocation can be instantiated
        let location = DNSCrashNetworkCodeLocation(self)
        XCTAssertNotNil(location)
        XCTAssertTrue(location is DNSCrashNetworkCodeLocation)
    }

    func test_domainpreface_should_returnexpectedvalue() {
        // Test domain preface
        let preface = DNSCrashNetworkCodeLocation.domainPreface
        XCTAssertEqual(preface, "com.doublenode.crashNetwork.")
    }
}