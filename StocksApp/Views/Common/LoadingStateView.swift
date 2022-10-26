//
//  LoadingStateView.swift
//  StocksApp
//
//  Created by Seungchul Ha on 2022/10/24.
//

import SwiftUI

struct LoadingStateView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
                .progressViewStyle(.circular)
            Spacer()
        }
    }
}

struct LoadingStateView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingStateView()
    }
}
