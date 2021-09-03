//
//  StringExtendTests.swift
//  RXMisTests
//  测试StringExtend中的方法
//  Created by 杨洋 on 2021/9/3.
//

import XCTest
class StringExtendTests: XCTestCase {
    
    //测试手机好格式
    func testIsPhone() {
        /// 这是一个正确的手机号格式
        
        /// 这里使用断言来判断结果一定为true
        /// 只有结果为true表示通过
        /// 也就表示我们的代码没问题
//        assert("13141111111".isPhone())
        
        /// 这是一个错误的手机号格式
        XCTAssertFalse("ixuea".isPhone())
    }
}
