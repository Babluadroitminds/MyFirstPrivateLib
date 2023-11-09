//
//  DataSourceState.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 18/06/2019.
//  Copyright © 2019 Apps People Pty Ltd. All rights reserved.
//

import Foundation

/// Enum type allowing to use enum-driven Table View Controllers for example
public enum DataSourceState<T> {
    case loading
    case populated([T])
    case empty
    case error(Error)
}

public extension DataSourceState {
    var currentItems: [T] {
        switch self {
        case .populated(let items): return items
        default: return []
        }
    }
}
