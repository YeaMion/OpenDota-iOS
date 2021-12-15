//
//  DotaHeroInfoView.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/14.
//

import SwiftUI

struct DotaHeroInfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var dotaData: DotaData
    var dotaHero: DotaHeroModel

    var body: some View {
        Text(dotaHero.localized_name ?? "Unknown")
    }
}
