//  Created by Axel Ancona Esselmann on 7/25/24.
//

import Foundation

extension String {
    init<ID>(id: ID) where ID: Hashable { self = "\(id)" }
}
