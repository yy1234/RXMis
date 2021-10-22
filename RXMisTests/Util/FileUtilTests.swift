//
//  FileUtilTests.swift
//  RXMisTests
//
//  Created by 杨洋 on 2021/9/3.
//

import XCTest

class FileUtilTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFormatFileSize()  {
        //第一个参数等于第二个参数
        XCTAssertEqual(FileUtil.formatFileSize(1), "1.00Byte")
        
        //第一个参数等于第二个参数
        //1234/1024=1.205078125
        XCTAssertEqual(FileUtil.formatFileSize(1234), "1.21K")
        
        //第一个参数不等于第二个参数
        XCTAssertNotEqual(FileUtil.formatFileSize(1234), "1.23K")
    }

}
