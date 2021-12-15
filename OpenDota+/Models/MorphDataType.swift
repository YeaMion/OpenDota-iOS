//
//  MorphDataType.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/12/14.
//

import Foundation

// 这里的类型用来兼容一些可变类型的JSON属性，叫这个名字是因为这些类型像水人一样可以变形成想要的形态

// 将bool转为0，int到int，string到string
enum MorphInt: Codable
{
    case int(Int)
    case string(String)

    func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        switch self
        {
        case .int(let v): try container.encode(v)
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws
    {
        let value = try decoder.singleValueContainer()

        do
        {
            if let v = try? value.decode(Int.self)
            {
                self = .int(v)
                return
            }
            else if (try? value.decode(Bool.self)) != nil
            {
                self = .int(0)
                return
            }
            else
            {
                self = .string(try value.decode(String.self))
                return
            }
        }
        catch DecodingError.typeMismatch
        {
            self = .string("")
        }
    }
}

// 可以将字符串数组变为由“/n”连接的字符串
enum MorphReturnString: Codable
{
    case string(String)

    func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        switch self
        {
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws
    {
        let value = try decoder.singleValueContainer()

        do
        {
            if let v = try? value.decode([String].self)
            {
                var str: String = ""
                for (idx, value) in v.enumerated()
                {
                    str.append(value)
                    if idx < (v.count - 1)
                    {
                        str.append("\n")
                    }
                }
                self = .string(str)
                return
            }
            else
            {
                self = .string(try value.decode(String.self))
                return
            }
        }
        catch DecodingError.typeMismatch
        {
            self = .string("")
        }
    }
}

// 可以将字符串数组变为由“/”连接的字符串
enum MorphSlashString: Codable
{
    case string(String)

    func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        switch self
        {
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws
    {
        let value = try decoder.singleValueContainer()

        do
        {
            if let v = try? value.decode([String].self)
            {
                var str: String = ""
                for (idx, value) in v.enumerated()
                {
                    str.append(value)
                    if idx < (v.count - 1)
                    {
                        str.append("\\")
                    }
                }
                self = .string(str)
                return
            }
            else
            {
                self = .string(try value.decode(String.self))
                return
            }
        }
        catch DecodingError.typeMismatch
        {
            self = .string("")
        }
    }
}

// 可以将单个字符串也变为字符串数组
enum MorphStringArray: Codable
{
    case stringArray([String])

    func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        switch self
        {
        case .stringArray(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws
    {
        let value = try decoder.singleValueContainer()

        if let v = try? value.decode([String].self)
        {
            self = .stringArray(v)
            return
        }
        else
        {
            let arr = try? value.decode(String.self)
            if arr != nil
            {
                self = .stringArray([arr!])
            }
            else { self = .stringArray([]) }
            return
        }
    }
}
