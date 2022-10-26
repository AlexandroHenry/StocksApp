//
//  ErrorStateView.swift
//  StocksApp
//
//  Created by Seungchul Ha on 2022/10/24.
//

import SwiftUI

struct ErrorStateView: View {
    
    let error: String
    var retryCallback: (() -> ())?
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 16) {
                Text(error)
                if let retryCallback {
                    Button("Retry", action: retryCallback)
                        .buttonStyle(.borderedProminent)
                }
            }
            Spacer()
        }
        .padding(64)
    }
}

struct ErrorStateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorStateView(error: "An Error Ocurred") {}
                .previewDisplayName("With Retry Button")
            
            ErrorStateView(error: "An Error Ocurred")
                .previewDisplayName("Without Retry Button")
        }
    }
}
