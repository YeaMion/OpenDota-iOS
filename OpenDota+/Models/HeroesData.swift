//
//  HeroesData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/14.
//

import Foundation

struct DotaHeroModel: Decodable, Identifiable {
    var id: Int
    var name: String
    var localized_name: String?
    var primary_attr: String?
    var attack_type: String?
    var roles: [String]?
    var img: String
    var icon: String
    var base_health: Double
    var base_health_regen: Double
    var base_mana: Double
    var base_mana_regen: Double
    var base_armor: Double
    var base_mr: Double
    var base_attack_min: Double
    var base_attack_max: Double
    var base_str: Double
    var base_agi: Double
    var base_int: Double
    var str_gain: Double
    var agi_gain: Double
    var int_gain: Double
    var attack_range: Double?
    var projectile_speed: Double?
    var attack_rate: Double?
    var move_speed: Double?
    var turn_rate: Double?
    var cm_enabled: Bool?
    var legs: Int?
}

struct DotaHeroInfoModel: Decodable {}
