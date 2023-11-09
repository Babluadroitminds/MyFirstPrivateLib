//
//  WebSocket+Codable.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 20/09/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import Starscream

extension WebSocket {
    /**
     Write an JSON-encodable object to the websocket. This sends it as a binary frame.

     If you supply a non-nil completion block, I will perform it when the write completes.

     - parameter object:       The data to write.
     - parameter encoder: The (optional) JSON encoder if different from the default one.
     - parameter completion: The (optional) completion handler.
     */
    open func write<T: Encodable>(object: T, with encoder: JSONEncoder = JSONEncoder(), completion: (() -> Void)? = nil) throws {
        let jsonData = try encoder.encode(object)
        write(data: jsonData, completion: completion)
    }
}
