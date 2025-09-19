//
//  NETCrashRouter.minimal.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetwork
//
//  MINIMAL VERSION FOR COMPILATION TESTING WITHOUT UIKit DEPENDENCIES
//  To use: mv NETCrashRouter.swift NETCrashRouter.full.swift && mv NETCrashRouter.minimal.swift NETCrashRouter.swift
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBlankNetwork
import DNSError
import DNSProtocols
import Foundation

// Minimal crash router that demonstrates fatalError behavior without full protocol dependencies
open class NETCrashRouter: NETBlankRouter {
    public required init() {
        super.init()
    }

    required public init(with netConfig: any NETPTCLConfig) {
        super.init(with: netConfig)
    }
    
    open override func configure() {
        // Configuration logic placeholder
        super.configure()
    }

    // MARK: - Crash Network Router Logic (Public) -
    open func urlRequest(using url: URL) {
        let location = DNSCrashNetworkCodeLocation(self)
        fatalError("NETCrashRouter.urlRequest(using:) not implemented - url: \(url), location: \(location)")
    }

    open func urlRequest(for code: String, using url: URL) {
        let location = DNSCrashNetworkCodeLocation(self)
        fatalError("NETCrashRouter.urlRequest(for:using:) not implemented - code: \(code), url: \(url), location: \(location)")
    }
}
