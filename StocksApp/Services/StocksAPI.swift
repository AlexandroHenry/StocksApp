//
//  StockAPI.swift
//  StocksApp
//
//  Created by Seungchul Ha on 2022/10/26.
//

import Foundation
import XCAStocksAPI

protocol StocksAPI {
    
    func searchTickers(query: String, isEquityTypeOnly: Bool) async throws -> [Ticker]
    func fetchQuotes(symbols: String) async throws -> [Quote]
}

extension XCAStocksAPI: StocksAPI {
    
}
