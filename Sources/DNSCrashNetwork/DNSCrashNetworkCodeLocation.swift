//
//  DNSCrashNetworkCodeLocation.minimal.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCrashNetwork
//
//  MINIMAL VERSION FOR COMPILATION TESTING WITHOUT UIKit DEPENDENCIES
//  To use: mv DNSCrashNetworkCodeLocation.swift DNSCrashNetworkCodeLocation.full.swift && mv DNSCrashNetworkCodeLocation.minimal.swift DNSCrashNetworkCodeLocation.swift
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSError

public extension DNSCodeLocation {
    typealias crashNetwork = DNSCrashNetworkCodeLocation
}
open class DNSCrashNetworkCodeLocation: DNSCodeLocation {
    override open class var domainPreface: String { "com.doublenode.crashNetwork." }
}