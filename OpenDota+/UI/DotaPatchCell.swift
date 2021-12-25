//
//  DotaPatchCell.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/25.
//

import SwiftUI

struct DotaPatchCell: View {
    var body: some View {
        ZStack {
            Image("PatchNoteCover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 70)
                .cornerRadius(8)
            Text("7.30e")
                .foregroundColor(.white)
                .font(.custom("Reaver-Bold", size: 26))
                .opacity(0.9)
        }
        .padding(.leading, 5)
        .padding(.trailing, 5)
    }
}

struct DotaPatchCell_Previews: PreviewProvider {
    static var previews: some View {
        DotaPatchCell()
    }
}
