//
//  DotaPatchCell.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/25.
//

import SwiftUI

struct DotaPatchCell: View {
    let patch: PatchNoteModel
    var body: some View {
        ZStack {
            Image("PatchNoteCover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 70)
                .cornerRadius(8)
            Text(patch.patch_name ?? "UNKNOWN")
                .foregroundColor(.white)
                .font(.custom("Radiance-SemiBold", size: 28))
                .bold()
                .padding(.top, 4)
                .opacity(0.9)
        }
        .padding(.leading, 5)
        .padding(.trailing, 5)
    }
}
