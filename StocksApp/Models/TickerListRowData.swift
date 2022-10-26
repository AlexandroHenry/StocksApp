//
//  TickerListRowData.swift
//  StocksApp
//
//  Created by Seungchul Ha on 2022/10/24.
//

import Foundation

typealias PriceChange = (price: String, change: String)

struct TickerListRowData {
    
    enum RowType {
        case main
        case search(isSaved: Bool, onButtonTapped: () -> ())
    }
    
    let symbol: String
    let name: String?
    let price: PriceChange?
    let type: RowType
    
}
