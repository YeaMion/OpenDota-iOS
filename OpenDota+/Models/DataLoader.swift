//
//  Data.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/10/5.
//

import SwiftUI

let dotaHeroesData: [DotaHeroModel] = loadDotaHeroes()
var dotaHeroesDic: [String: DotaHeroModel] = [:]

let dotaItemsData: [DotaItemModel] = loadDotaItems()
var dotaItemsDic: [String: DotaItemModel] = [:]

let dotaRecentMatchesData: [DotaMatchModel] = [
    DotaMatchModel(id: 1, heroName: "HOODWINK", heroKey: "hoodwink", playTime: "45 mins ago", KDA: "12/4/6", LD: "232/15", winLost: true),
    DotaMatchModel(id: 2, heroName: "Juggernaut", heroKey: "juggernaut", playTime: "4 hours ago", KDA: "19/9/12", LD: "226/23", winLost: false),
    DotaMatchModel(id: 3, heroName: "Legion Commander", heroKey: "legion_commander", playTime: "2 days ago", KDA: "5/2/3", LD: "102/7", winLost: true),
    DotaMatchModel(id: 4, heroName: "Marci", heroKey: "marci", playTime: "3 weeks ago", KDA: "3/7/2", LD: "76/4", winLost: false),
    DotaMatchModel(id: 5, heroName: "Medusa", heroKey: "medusa", playTime: "7 months ago", KDA: "23/10/7", LD: "323/21", winLost: true)
]

private func loadDotaHeroes() -> [DotaHeroModel] {
    do {
        dotaHeroesDic = load("dotaHeroes.json")

        // let dic: [String: DotaItemModel] = try decoder.decode([String: DotaItemModel].self, from: data)
        var lis: [DotaHeroModel] = []
        for (_, itemValue) in dotaHeroesDic {
            lis.append(itemValue)
        }
        lis = lis.sorted(by: { a, b -> Bool in
            a.id < b.id
        })
        return lis
    }
}

private func loadDotaItems() -> [DotaItemModel] {
    do {
        dotaItemsDic = load("dotaItems.json")

        // let dic: [String: DotaItemModel] = try decoder.decode([String: DotaItemModel].self, from: data)
        var lis: [DotaItemModel] = []
        for (_, itemValue) in dotaItemsDic {
            lis.append(itemValue)
        }
        return lis
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
