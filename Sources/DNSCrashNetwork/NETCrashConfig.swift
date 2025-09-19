//
//  NETCrashConfig.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetwork
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBlankNetwork
import DNSError
import DNSProtocols
import Foundation

open class NETCrashConfig: NETBlankConfig {
    public required init() {}

    open override func configure() { }

    open override func enableOption(_ option: String) { }
    open override func disableOption(_ option: String) { }

    // MARK: - UIWindowSceneDelegate methods
    open override func didBecomeActive() { }
    open override func willResignActive() { }
    open override func willEnterForeground() { }
    open override func didEnterBackground() { }

    // MARK: - Network Config Logic (Public) -
    open override func urlComponents() -> NETPTCLConfigResURLComponents {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }

    open override func urlComponents(for code: String) -> NETPTCLConfigResURLComponents {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }

    open override func urlComponents(set components: URLComponents, for code: String) -> NETPTCLConfigResVoid {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }

    open override func restHeaders() -> NETPTCLConfigResHeaders {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }

    open override func restHeaders(for code: String) -> NETPTCLConfigResHeaders {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }

    open override func urlRequest(using url: URL) -> NETPTCLConfigResURLRequest {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }

    open override func urlRequest(for code: String, using url: URL) -> NETPTCLConfigResURLRequest {
        let location = DNSCrashNetworkCodeLocation(self)
        return .failure(DNSError.NetworkBase.notImplemented(transactionId: "", location))
    }
}
