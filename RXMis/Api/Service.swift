//
//  Service.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/3.
//

import Foundation
import Moya

enum Service {
    case sheetDetail(id: String)
    case sheets
}

extension Service: TargetType {
    //返回网址
    var baseURL: URL {
        return URL(string: ENDPOINT)!
    }
//    路径
    var path: String {
        switch self {
        case .sheets:
            return "/v1/sheets"
        case .sheetDetail(id: let id):
            return "/v1/sheets/\(id)"

        default:
            return ""
        }
    }
//    方法
    var method: Moya.Method {
        return .get
        
    }
//    测试相关的方法
    var sampleData: Data {
        return Data()
        
    }
//    请求的参数
    var task: Task {
        //不传递参数
        return .requestPlain
    }
//    请求头
    var headers: [String : String]? {
        return nil
    }
    
    
}
