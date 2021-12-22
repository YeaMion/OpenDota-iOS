//
//  MatchesData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/22.
//

import Foundation

struct DotaMatchModel: Decodable, Identifiable {
    var id: Int
    var heroName: String
    var heroKey: String
    var playTime: String
    var KDA: String
    var LD: String
    var winLost: Bool
}
