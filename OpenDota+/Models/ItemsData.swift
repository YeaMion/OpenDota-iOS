//
//  ItemsData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/10/4.
//

import SwiftUI

struct Attrib: Decodable, Hashable
{
    static func == (lhs: Attrib, rhs: Attrib) -> Bool
    {
        let lhsVal: String
        let rhsVal: String
        switch lhs.value
        {
        case .string(let l): lhsVal = l
        case .none: lhsVal = ""
        }
        switch rhs.value
        {
        case .string(let r): rhsVal = r
        case .none: rhsVal = ""
        }
        return lhs.key==rhs.key&&lhs.header==rhs.header&&lhs.footer==rhs.footer&&lhs.generated==rhs.generated&&lhsVal==rhsVal
    }

    func hash(into hasher: inout Hasher)
    {
        hasher.combine(key)
        hasher.combine(header)
        hasher.combine(footer)
        hasher.combine(generated)
        let val: String
        switch value
        {
        case .string(let l): val = l
        case .none: val = ""
        }
        hasher.combine(val)
    }

    var key: String?
    var header: String?
    var footer: String?
    var generated: Bool?

    /// <summary>
    /// 例如大根，根据不同等级增加不同的属性，这个时候 value 为数组 string[]，否则为 string
    /// </summary>
    var value: MorphSlashString?
}

struct DotaItemModel: Decodable, Identifiable
{
    /// <summary>
    /// 使用的介绍，可能有多条，例如第一条是主动效果，第二条是被动
    /// </summary>
    var hint: MorphReturnString?

    /// <summary>
    /// 物品的 id
    /// int/bool
    /// </summary>		
    var id: Int

    /// <summary>
    /// https://steamcdn-a.akamaihd.net/apps/dota2/images/items/{img}.png
    /// </summary>
    var img: String

    /// <summary>
    /// 显示的名字
    /// </summary>
    var dname: String?

    /// <summary>
    /// 物品分类，“神秘”“圣物”等等
    /// </summary>
    var qual: String?

    /// <summary>
    /// 价格
    /// int/bool
    /// </summary>
    var cost: MorphInt?

    /// <summary>
    /// 备注，比如风杖的 notes 是你不能对友军使用
    /// </summary>
    var notes: MorphReturnString?

    /// <summary>
    /// 冷却时间
    /// int/bool
    /// </summary>
    var cd: MorphInt?

    /// <summary>
    /// 背景介绍，就是物品介绍界面最底部那几句介绍的话
    /// </summary>
    var lore: MorphReturnString?

    /// <summary>
    /// 合成配方
    /// </summary>
    var components: MorphStringArray?

    /// <summary>
    /// 似乎是表示物品是否需要合成
    /// </summary>
    var created: Bool? = false

    /// <summary>
    /// 属性加成
    /// </summary>
    var attrib: [Attrib]?

    /// <summary>
    /// 似乎没什么用，只有二级散失有这个值，对应的是其他物品的 hint
    /// </summary>
    var desc: String?

    /// <summary>
    /// 消耗品，例如芒果的 charges = 1，吃树的 charges = 3
    /// int/bool
    /// </summary>
    var charges: MorphInt?

    /// <summary>
    /// 中立物品等级
    /// int/bool
    /// </summary>
    var tier: MorphInt?

    /// <summary>
    /// mana cost 魔法消耗
    /// int/bool
    /// </summary>
    var mc: MorphInt?

//    enum CodingKeys: String, CodingKey
//    {
//        case hint
//        case id
//        case img
//        case dname
//        case qual
//        case cost
//        case notes
//        case cd
//        case lore
//        case components
//        case created
//        case attrib
//        case desc
//        case charges
//        case tier
//        case mc
//    }

//    init(from decoder: Decoder) throws
//    {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.hint = try container.decodeIfPresent([String]?.self, forKey: .hint) ?? [""]
//        self.id = try container.decodeIfPresent(Int?.self, forKey: .id) ?? 0
//        self.img = try container.decodeIfPresent(String?.self, forKey: .img) ?? ""
//        self.dname = try container.decodeIfPresent(String?.self, forKey: .dname) ?? ""
//        self.qual = try container.decodeIfPresent(String?.self, forKey: .qual) ?? ""
//        self.cost = try container.decodeIfPresent(Int?.self, forKey: .cost) ?? 0
//        self.notes = try container.decodeIfPresent(String?.self, forKey: .notes) ?? ""
//        self.cd = try container.decodeIfPresent(Int?.self, forKey: .cd) ?? 0
//        self.lore = try container.decodeIfPresent(String?.self, forKey: .lore) ?? ""
//        self.components = try container.decodeIfPresent([String]?.self, forKey: .components) ?? [""]
//        self.created = try container.decodeIfPresent(Bool?.self, forKey: .created) ?? false
//        self.attrib = try container.decodeIfPresent([Attrib]?.self, forKey: .attrib) ?? []
//        self.desc = try container.decodeIfPresent(String?.self, forKey: .desc) ?? ""
//        self.charges = try container.decodeIfPresent(Int?.self, forKey: .charges) ?? 0
//        self.tier = try container.decodeIfPresent(Int?.self, forKey: .tier) ?? 0
//        self.mc = try container.decodeIfPresent(Int?.self, forKey: .mc) ?? 0
//    }
}
