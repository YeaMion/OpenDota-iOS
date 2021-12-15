//
//  Data.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/10/5.
//

import SwiftUI
import UIKit

let dotaHeroesData: [DotaHeroModel] = loadDotaHeroes()
var dotaHeroesDic: [String: DotaHeroModel] = [:]

let dotaItemsData: [DotaItemModel] = loadDotaItems()
var dotaItemsDic: [String: DotaItemModel] = [:]

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
