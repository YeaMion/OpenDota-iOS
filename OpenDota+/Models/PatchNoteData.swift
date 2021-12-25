//
//  PatchNoteData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/25.
//

import Foundation

struct PatchesModel: Decodable {
    var patches: [PatchNoteModel]?
    var success: Bool?
}

struct PatchNoteModel: Decodable {
    var patch_name: String?
    var patch_number: String?
    var patch_timestamp: Int64?
}
