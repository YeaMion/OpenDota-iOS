//
//  SegmentedBar.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2022/1/9.
//

import SwiftUI

struct SegmentedBar: View {
    @Binding var values: [Double]
    @State var colors: [Color]
    @State var isVertical: Bool

    private var totalValue: Double {
        return values.reduce(0) { res, val -> Double in
            res + val
        }
    }

    var body: some View {
        GeometryReader { geometry in
            if self.isVertical {
                VStack(alignment: .center, spacing: 4) {
                    ForEach(self.values.indices) { i in
                        Rectangle()
                            .frame(width: nil, height: geometry.size.height * CGFloat(self.values[i]/self.totalValue), alignment: .center)
                            .foregroundColor(self.colors[i])
                            .cornerRadius(geometry.size.width/2.0)
                            .animation(.easeInOut, value: 0.3)
                    }
                }
            } else {
                HStack(alignment: .center, spacing: 4.0) {
                    ForEach(self.values.indices) { i in
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(self.values[i]/self.totalValue), height: nil, alignment: .center)
                            .foregroundColor(self.colors[i])
                            .cornerRadius(geometry.size.height/2.0)
                            .animation(.easeInOut, value: 0.3)
                    }
                }
            }
        }
    }
}
