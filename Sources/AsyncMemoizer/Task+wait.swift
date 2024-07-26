//  Created by Axel Ancona Esselmann on 7/25/24.
//

import Foundation

public extension Task where Success == Void, Failure == Never {
    func wait() async {
        await value
    }
}
