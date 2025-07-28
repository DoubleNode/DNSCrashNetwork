//
//  NETCrashConfig.swift
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

open class NETCrashConfig: NETBlankConfig {
    public required init() { super.init() }

    // MARK: - Network Config Logic (Public) -
    override open func urlComponents() -> NETPTCLConfigResURLComponents {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func urlComponents(for code: String) -> NETPTCLConfigResURLComponents {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func urlComponents(set components: URLComponents, for code: String) -> NETPTCLConfigResVoid {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func restHeaders() -> NETPTCLConfigResHeaders {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func restHeaders(for code: String) -> NETPTCLConfigResHeaders {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func urlRequest(using url: URL) -> NETPTCLConfigResURLRequest {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
    override open func urlRequest(for code: String,
                                  using url: URL) -> NETPTCLConfigResURLRequest {
        let error = DNSError.NetworkBase.notImplemented(transactionId: "", .crashNetwork(self))
        fatalError(error.errorString)
    }
}
