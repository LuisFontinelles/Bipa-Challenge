//
//  ViewState.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case loaded([LightningNodeResponse])
    case empty
    case error(String)
}
