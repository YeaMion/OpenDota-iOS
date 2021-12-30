//
//  PatchNoteData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/25.
//

import Alamofire
import Foundation

class PatchesViewModel: Decodable, ObservableObject {
    @Published var patches: [PatchNoteModel]?
    @Published var success: Bool?

    @Published var isLoading: Bool = true

    var isFetchFinished: Bool = false

    enum CodingKeys: CodingKey {
        case patches
        case success
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        patches = try values.decode([PatchNoteModel].self, forKey: .patches)
        success = try values.decode(Bool.self, forKey: .success)
    }

    init() {
        patches = [
            PatchNoteModel(patch_name: "123", patch_number: "123", patch_timestamp: 123),
            PatchNoteModel(patch_name: "123", patch_number: "123", patch_timestamp: 123),
            PatchNoteModel(patch_name: "123", patch_number: "123", patch_timestamp: 123),
            PatchNoteModel(patch_name: "123", patch_number: "123", patch_timestamp: 123),
            PatchNoteModel(patch_name: "123", patch_number: "123", patch_timestamp: 123),
            PatchNoteModel(patch_name: "123", patch_number: "123", patch_timestamp: 123)
        ]
        success = false
    }

    func requestPatches() {
        if isFetchFinished == true {
            return
        }
        AF.request("https://www.dota2.com/datafeed/patchnoteslist?language=english")
            .validate(statusCode: 200 ..< 300)
            .responseString { response in
                switch response.result {
                    case .success:
                        if let jsonString = response.value {
                            do {
                                let jsonData = jsonString.data(using: .utf8)!
                                let decoder = JSONDecoder()
                                let pchs = try decoder.decode(PatchesViewModel.self, from: jsonData)
                                if pchs.success == true {
                                    var patchesTemp: [PatchNoteModel] = []
                                    if pchs.patches != nil, pchs.patches?.isEmpty == false {
                                        patchesTemp = pchs.patches!
                                    }
                                    patchesTemp.reverse()
                                    self.patches?.removeAll()
                                    self.patches = []
                                    var i = 0
                                    let count = min(20, patchesTemp.count)
                                    while count > i {
                                        self.patches?.append(patchesTemp[i])
                                        i += 1
                                    }
                                    self.isLoading = false
                                    if self.patches?.isEmpty == false {
                                        self.isFetchFinished = true
                                    }
                                }
                            } catch {}
                        }
                    case let .failure(error):
                        print(error)
                }
            }
    }
}

struct PatchNoteModel: Decodable {
    var patch_name: String?
    var patch_number: String?
    var patch_timestamp: Int64?
}

public extension KeyedDecodingContainer {
    func decodeIfPresent<T>(_ type: T.Type, forKey key: K) throws -> T? where T: Decodable {
        return try? decode(type, forKey: key)
    }
}
