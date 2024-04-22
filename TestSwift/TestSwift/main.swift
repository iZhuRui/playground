//
//  main.swift
//  TestSwift
//
//  Created by ST on 2024/4/22.
//

import Foundation

/**
 enum TestEnum {
 case test1, test2, test3
 }
 /**
  增加原始值，内存里存的值还是0、1、2
  enum TestEnum: Int {
  case test1 = 2, test2 = 3, test3 = 4
  }
  */
 //t这个枚举变量只占1个字节
 var t = TestEnum.test1//0
 print(Mems.ptr(ofVal: &t))
 t = .test2//1
 t = .test3//2
 print(123)

 //print(MemoryLayout<TestEnum>.size)//实际用
 //print(MemoryLayout<TestEnum>.stride)//分配
 //print(MemoryLayout<TestEnum>.alignment)//对齐
 */

/**
 enum TestEnum {
     case test1(Int, Int, Int)//最大占用内存24
     case test2(Int, Int)//最大占用内存16
     case test3(Int)//最大占用内存8
     case test4(Bool)//最大占用内存1
     case test5
 }
 var e = TestEnum.test1(1, 2, 3)//24
 // 01 00 00 00 00 00 00 00
 // 02 00 00 00 00 00 00 00
 // 03 00 00 00 00 00 00 00
 // 00（test的成员值）
 // 00 00 00 00 00 00 00


 print(Mems.ptr(ofVal: &e))
 e = .test2(4, 5)
 // 04 00 00 00 00 00 00 00
 // 05 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 01
 // 00 00 00 00 00 00 00

 e = .test3(6)
 // 06 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 02
 // 00 00 00 00 00 00 00

 e = .test4(true)
 // 01 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 03
 // 00 00 00 00 00 00 00

 e = .test5
 // 00 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 00 00 00 00 00 00 00 00
 // 04
 // 00 00 00 00 00 00 00

 //1个字节存储成员值
 //N个字节存储关联值（N取占用内存最大的关联值），任何一个case的关联值都共用这N个字节
 //共用体
 */

/**
 enum TestEnum {
     case test
 }
 var t = TestEnum.test//只有一个case，不需要存什么值去区分是哪个case
 print(Mems.ptr(ofVal: &t))
 print(MemoryLayout<TestEnum>.size)//实际用  0,为0可以理解为没有内存，表面是个变量，实际没有内存
 print(MemoryLayout<TestEnum>.stride)//分配  1
 print(MemoryLayout<TestEnum>.alignment)//对齐  1

 enum TestEnum {
     case test(Int)
 }
 var t = TestEnum.test(9)//只有一个case，不需要存什么值去区分是哪个case
 print(Mems.ptr(ofVal: &t))
 print(MemoryLayout<TestEnum>.size)//8
 print(MemoryLayout<TestEnum>.stride)//8
 print(MemoryLayout<TestEnum>.alignment)//8
 */


//print(MemoryLayout<TestEnum>.size)//实际用
//print(MemoryLayout<TestEnum>.stride)//分配
//print(MemoryLayout<TestEnum>.alignment)//对齐


enum TestEnum {
    case test1(Int, Int, Int)
    case test2(Int, Int)
    case test3(Int)
    case test4(Bool)
    case test5
}
var e = TestEnum.test1(1, 2, 3)
//switch可以根据内存中，最后一个字节的成员值，去直接找是哪个
switch e {
case let .test1(v1, v2, v3):
    print("test1", v1, v2, v3)
    
case let .test2(v1, v2):
    print("test2", v1, v2)
    
default: break
    
}
