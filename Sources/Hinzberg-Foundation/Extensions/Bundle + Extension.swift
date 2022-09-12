//  Bundle + Extension.swift
//  Created by Holger Hinzberg on 12.09.22.

import SwiftUI

public extension Bundle {

    var releaseVersionNumber: String {
        let version = self.infoDictionary?["CFBundleShortVersionString"] as? String
        if let version = version {
            return version
        }
        return ""
    }

    var buildVersionNumber: String {
        let version =  self.infoDictionary?["CFBundleVersion"] as? String
        if let version = version {
            return version
        }
        return ""
    }
}
