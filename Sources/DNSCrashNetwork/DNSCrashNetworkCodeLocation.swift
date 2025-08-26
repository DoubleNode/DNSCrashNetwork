//
//  DNSCrashNetworkCodeLocation.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetwork
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSError
import DNSProtocols

public extension DNSCodeLocation {
    typealias crashNetwork = DNSCrashNetworkCodeLocation
}
open class DNSCrashNetworkCodeLocation: DNSCodeLocation, @unchecked Sendable {
    override open class var domainPreface: String { "com.doublenode.crashNetwork." }
}
