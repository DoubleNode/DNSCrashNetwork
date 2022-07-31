//
//  NETCrashConfig.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetwork
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import Alamofire
import DNSBlankNetwork
import DNSDataObjects
import DNSError
import DNSProtocols
import Foundation

open class NETCrashConfig: NETBlankConfig {
    public required init() { super.init() }

    // MARK: - Worker Logic (Public) -
    override open func restHeaders() throws -> HTTPHeaders {
        throw DNSError.NetConfig
            .notImplemented(DNSCodeLocation.crashNetwork(self, "\(#file),\(#line),\(#function)"))
    }
}
