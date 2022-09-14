//
//  ParametersEnums.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 14/09/22.
//

import Foundation
import SwiftUI

enum Time: String, CaseIterable, Identifiable {
    case _30, _60, _90, _120, _150, _180, _more
    var id: Self { self }
}

enum Price: String, CaseIterable, Identifiable {
    case _0, _5, _10, _20, _50, _100, _more
    var id: Self { self }
}
