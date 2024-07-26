//  Created by Axel Ancona Esselmann on 7/25/24.
//

import Foundation

@globalActor
public actor AsyncMemoizer {

    public typealias Hold = Task<(), Never>

    public enum Claim {
        case hold(Hold)
        case claimed(Hold)
    }

    public static var shared = AsyncMemoizer()

    private var holds: [String: Hold] = [:]

    public func claim<ID>(_ id: ID) -> Claim
        where ID: Hashable
    {
        let idString = String(id: id)
        if let hold = holds[idString] {
            return .hold(hold)
        } else {
            let hold = Hold(priority: .background) {
                while !Task.isCancelled { }
            }
            holds[idString] = hold
            return .claimed(hold)
        }
    }

    public func release<ID>(_ id: ID) where ID: Hashable {
        let idString = String(id: id)
        if let hold = holds[idString] {
            hold.cancel()
            holds[idString] = nil
        }
    }
}
