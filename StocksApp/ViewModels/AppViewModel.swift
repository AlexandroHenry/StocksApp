//
//  AppViewModel.swift
//  StocksApp
//
//  Created by Seungchul Ha on 2022/10/24.
//

import Foundation
import SwiftUI
import XCAStocksAPI

@MainActor
class AppViewModel: ObservableObject {
    
    @Published var tickers: [Ticker] = [] {
        didSet { saveTickers() }
    }
    
    @Published var selectedTicker: Ticker?
    
    var titleText = "XCA Stocks"
    @Published var subtitleText: String
    var emptyTickersText = "Search & Add Symbol to see Stock Quotes"
    var attributionText = "Powered by Yahoo Finance API"
    
    private let subtitleDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "d MMM"
        return df
    }()
    
    let tickerListRepositry: TickerListRepository
    
    init(repository: TickerListRepository = TickerPlistRepository()) {
        self.tickerListRepositry = repository
        self.subtitleText = subtitleDateFormatter.string(from: Date())
        loadTickers()
    }
    
    private func loadTickers() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                self.tickers = try await tickerListRepositry.load()
            } catch {
                print(error.localizedDescription)
                self.tickers = []
            }
        }
    }
    
    private func saveTickers() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await tickerListRepositry.save(self.tickers)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func removeTickers(atOffsets offsets: IndexSet) {
        tickers.remove(atOffsets: offsets)
    }
    
    
    func isAddedToMyTickers(ticker: Ticker) -> Bool {
        tickers.first { $0.symbol == ticker.symbol } != nil
    }
    
    func toggleTicker(_ ticker: Ticker) {
        if isAddedToMyTickers(ticker: ticker) {
            removeFromMyTickers(ticker: ticker)
        } else {
            addToMyTickers(ticker: ticker)
        }
    }
    
    private func addToMyTickers(ticker: Ticker) {
        tickers.append(ticker)
    }
    
    func removeFromMyTickers(ticker: Ticker) {
        guard let index = tickers.firstIndex(where: { $0.symbol == ticker.symbol}) else { return }
        tickers.remove(at: index)
    }
    
    func openYahooFinance() {
        let url = URL(string: "https://finance.yahoo.com")!
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
}
