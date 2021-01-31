//
//  File.swift
//  
//
//  Created by Brett Fazio on 1/26/21.
//

import Foundation

public struct UIModel: Codable {
    public var name: String
    public var primary: String
    
    public var inner: [UIModel]
    
    public init(name: String, primary: String, inner: [UIModel]) {
        self.name = name
        self.primary = primary
        self.inner = inner
    }
}
