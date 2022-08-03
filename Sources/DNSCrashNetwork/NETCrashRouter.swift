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
    override open func dataRequest(for code: String) -> NETPTCLRouterResDataRequest {
        let error = DNSError.NetworkBase
            .notImplemented(DNSCodeLocation.crashNetwork(self, "\(#file),\(#line),\(#function)"))
        return .failure(error)
    }
    override open func asURLRequest() throws -> NETPTCLRouterRtnURLRequest {
        let error = DNSError.NetworkBase
            .notImplemented(DNSCodeLocation.crashNetwork(self, "\(#file),\(#line),\(#function)"))
        throw error
    }
    override open func asURLRequest(for code: String) -> NETPTCLRouterResURLRequest {
        let error = DNSError.NetworkBase
            .notImplemented(DNSCodeLocation.crashNetwork(self, "\(#file),\(#line),\(#function)"))
        return .failure(error)
    }
}
