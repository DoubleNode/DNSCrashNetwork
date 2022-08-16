//
//  NETCrashRouter.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetwork
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import Alamofire
import DNSBlankNetwork
import DNSError
import DNSProtocols
import Foundation

open class NETCrashRouter: NETBlankRouter {
    public required init() {
        super.init()
        self.configure()
    }
    public required init(with netConfig: NETPTCLConfig) {
        super.init()
        self.configure()
    }

    // MARK: - Network Router Logic (Public) -
    override open func urlRequest(using url: URL) -> NETPTCLRouterResURLRequest {
        let error = DNSError.NetworkBase.notImplemented(.crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func urlRequest(for code: String,
                                  using url: URL) -> NETPTCLRouterResURLRequest {
        let error = DNSError.NetworkBase.notImplemented(.crashNetwork(self))
        fatalError(error.errorString)
    }
}
