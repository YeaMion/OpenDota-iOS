//
//  DotaData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/8.
//

import Combine
import SwiftUI

final class DotaData: ObservableObject {
    @Published var dotaHeroesList = dotaHeroesData
    @Published var dotaHeroesDict = dotaHeroesDic
    @Published var dotaItemsList = dotaItemsData
    @Published var dotaItemsDict = dotaItemsDic
    @Published var dotaRecentMatchedList = dotaRecentMatchesData
}
