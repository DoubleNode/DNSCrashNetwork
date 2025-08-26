//
//  DNSCrashNetworkCodeLocationTests.swift
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

final class DNSCrashNetworkCodeLocationSpecificTests: XCTestCase, @unchecked Sendable {
    
    func testCodeLocationInheritsFromDNSCodeLocation() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        XCTAssertTrue(codeLocation is DNSCodeLocation)
    }
    
    func testDomainPrefaceIsCorrect() {
        XCTAssertEqual(DNSCrashNetworkCodeLocation.domainPreface, "com.doublenode.crashNetwork.")
    }
    
    func testCodeLocationConformsToSendable() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        
        Task {
            await testSendableCodeLocation(codeLocation)
        }
    }
    
    private func testSendableCodeLocation(_ codeLocation: DNSCrashNetworkCodeLocation) async {
        XCTAssertNotNil(codeLocation)
    }
    
    func testTypealiasWorks() {
        let typealiasType = DNSCodeLocation.crashNetwork.self
        let directType = DNSCrashNetworkCodeLocation.self
        
        XCTAssertTrue(typealiasType == directType)
    }
    
    func testCodeLocationUsedInErrorCreation() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        let error = DNSError.NetworkBase.notImplemented(
            transactionId: "test-transaction-123",
            .crashNetwork(codeLocation)
        )
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.errorString.contains("Not Implemented"))
    }
    
    func testMultipleCodeLocationInstances() {
        let location1 = DNSCrashNetworkCodeLocation(self)
        let location2 = DNSCrashNetworkCodeLocation(self)
        let location3 = DNSCodeLocation.crashNetwork(self)
        
        XCTAssertNotNil(location1)
        XCTAssertNotNil(location2)
        XCTAssertNotNil(location3)
        
        XCTAssertFalse(location1 === location2)
        XCTAssertFalse(location2 === location3)
        XCTAssertTrue(type(of: location3) == DNSCrashNetworkCodeLocation.self)
    }
    
    func testCodeLocationWithDifferentTransactionIds() {
        let codeLocation = DNSCrashNetworkCodeLocation(self)
        
        let error1 = DNSError.NetworkBase.notImplemented(
            transactionId: "transaction-001",
            .crashNetwork(codeLocation)
        )
        
        let error2 = DNSError.NetworkBase.notImplemented(
            transactionId: "transaction-002", 
            .crashNetwork(codeLocation)
        )
        
        XCTAssertNotNil(error1)
        XCTAssertNotNil(error2)
        XCTAssertTrue(error1.errorString.contains("Not Implemented"))
        XCTAssertTrue(error2.errorString.contains("Not Implemented"))
    }
}
