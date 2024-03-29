//func pi() -> Double {
//    return 3.14
//}
//print(pi())
//
//func sum(v1:Int, v2:Int) -> Int {
//    return v1 + v2
//}
//
//print(sum(v1: 10, v2: 30))

//func hello() -> Void{
//    print("hello")
//}
//
//func hello() -> () {
//    print("hello")
//}

//func hello() {
//    print("hello")
//}
//
//hello()

//如果整个函数体是一个单一表达式，那么函数会隐式返回这个表达式
//func sum(v1:Int, v2:Int) -> Int {
//    v1 + v2
//}
//sum(v1: 30, v2: 20)

//返回元组：实现多返回值
//func calculate(v1:Int, v2:Int) -> (sum:Int, difference:Int, average:Int) {
//    let sum = v1 + v2
//    return (sum, v1 - v2, sum >> 1)
//}
//
//let result = calculate(v1: 40, v2: 30)
//result.sum
//result.difference
//result.average


//函数文档注释
/// 求和【概述】
///
/// 将2个整数相加【更详细的描述】
///
/// - Parameter v1:第一个整数
/// - Parameter v2:第二个参数
/// - Returns:两个整数的和
///
/// - Note:传入两个整数即可【批注】
///
//func sum(v1:Int, v2:Int) -> Int {
//    v1 + v2
//}


//func goToWork (at time: String) {
//    print("time is \(time)")
//}
//
//goToWork(at: "09:00")
//
//func sumFunc(_ v1:Int, _ v2:Int) {
//    v1 + v2
//}
//
//sumFunc(30, 20)


/**
 默认参数值
 参数可以有默认值
 func check(name: String = "someone", age: Int, job: String = "none") {
     print("name=\(name), age=\(age), job=\(job)")
 }

 check(name: "jack", age: 19, job: "coder")
 check(name: "rose", age: 18)
 check(age: 17, job: "fireman")
 check(age: 16)
 //C++的默认参数值有个限制：必须从右往左设置，由于swift拥有参数标签，因此并没有此类限制
 //但是在省略参数标签时，需要特别注意，避免出错
 
 
 //这里的middle不可以省略参数标签
 //由于三个参数都可以省略标签，传参的时候都可不用写标签
 func test (_ first:Int = 10, _ middle:Int, _ last:Int = 30){
     print("ffff")
 }
 //三个参数都没有标签，不是把30传给没有默认值的middle，而是会按顺序传参，会导致middle没有值，报错
 test(30)
 //要保证调用的时候每个参数都有值
 */


/**
 //可变参数
 //一个函数最多只能有一个可变参数
 func sum(_ numbers:Int...) -> Int {
     var total = 0
     for number in numbers {
         total += number
     }
     return total
 }

 sum(10, 20, 30)

 //紧跟在可变参数后面的参数不能省略参数标签，参数string不能省略标签，如果用省略标签，会造成可变参数和后面一个参数的歧义
 func test (_ numbers:Int..., string:String, _ other:String) {
     print(numbers)
     print(string);
     print(other)
 }
 test(20,30,40, string: "aa", "bb")
 */

/**
 自带print
 print("1","2","3")
 print("1","2","3", separator: "z", terminator: "\n")
 */

/**
 输入输出参数（In-Out Parameter）
 可以用inout定义一个输入输出参数：可以在函数内部修改外部实参的值
 
 var number = 10
 func add(_ num: inout Int){
     num += 10
 }
 add(&number)
 print(number)

 //func swapValues (_ v1:inout Int, _ v2:inout Int){
 //    let tmp = v1
 //    v1 = v2
 //    v2 = tmp
 //}
 func swapValues (_ v1: inout Int, _ v2: inout Int) {
     (v1, v2) = (v2, v1)
 }
 var num1 = 20
 var num2 = 40
 swapValues(&num1, &num2)
 print("\(num1),\(num2)")

 //可变参数不能标记为inout
 //inout参数不能有默认值
 //inout参数的本质是地址传递（引用传递）

 var numbers = [10, 20, 30]
 numbers[0] = 20
 numbers[0] = 30

 func test (_ num: inout Int) {
     print("\(num)")
 }
 test(&numbers[0])
 //innout参数只能传入可以被多次赋值的
 */



/**
 //函数重载
 规则
 1.函数名相同
 2.参数个数不同、参数类型不同、参数标签不同
 
 
 func sum(v1:Int, v2:Int) {
     v1+v2
 }

 func sum(v1:Int, v2:Int, v3:Int) {
     v1+v2+v3
 }//参数个数不同

 func sum(v1:Int, v2:Double) -> Double {
     Double(v1) + v2
 }//参数类型不同

 func sum(_ v1:Int, _ v2:Int) -> Int{
     v1+v2
 }//参数标签不同，调用的时候是没有标签的

 func sum(a:Int, b:Int) -> Int {
     a+b
 }//参数标签不同

 
 函数重载注意点
 1.返回值类型与函数重载无关
 func sum(v1: Int, v2: Int) -> Int {v1 + v2}
 func sum(v1: Int, v2: Int) { }
 sum(v1: 10, v2: 30)
 
 
 2.默认参数值和函数重载一起使用产生二义性时，编译器并不会报错（C++中会报错）
 func sum(v1: Int, v2: Int) -> Int {
     v1 + v2
 }
 func sum(v1: Int, v2: Int, v3: Int = 10) -> Int {
     v1 + v2 + v3
 }
 // 会调用sum(v1: Int, v2: Int)
 sum(v1: 10, v2: 40)
 
 
 
 
 3.可变参数、省略参数标签、函数重载一起使用产生二义性时，编译器有可能会报错
 func sum(v1: Int, v2: Int) -> Int {
     v1 + v2
 }
 func sum(_ v1: Int,_ v2: Int) -> Int {
     v1 + v2
 }
 func sum(_ numbers:Int...) -> Int {
     var total = 0
     for number in numbers {
         total += number
     }
     return total
 }
 sum(10, 20)
 */

/**
 //内联函数
 //如果开启了编译器优化（release模式默认会开启优化），编译器会自动将某些函数变成内联函数
 //内联函数其实是将函数调用展开成函数体，可以省略函数开启和关闭栈空间
 //以下函数不会被内联
 //1.函数体比较长
 //2.包含递归调用
 //3.包含动态派发
 
 //永远不会被内联（即使开启了编译器优化）
 @inline(never) func test() {
     print("test")
 }

 //开启编译器优化后，即使代码很长，也会被内联（递归调用函数、动态派发的函数除外）
 @inline(__always) func test() {
     print("test")
 }
 
 //在release模式下，编译器已经开启优化，会自动决定哪些函数需要内联，因此没必要使用@inline
 */


/**
 //函数类型
 //每一个函数都是有类型的，函数类型由形式参数类型、返回值类型组成
 func test() {} // () -> Void 或者 () -> ()
 func sumTest(a:Int, b:Int) -> Int{
     a+b
 }// (Int, Int) -> Int

 //定义变量
 var fn:(Int, Int) -> Int = sumTest
 fn(2,4)//6,调用时不需要参数标签

 //函数类型作为函数参数
 func sum(v1: Int, v2: Int) -> Int {
     v1 + v2
 }
 func difference(v1: Int, v2: Int) -> Int {
     v1 - v2
 }
 func printResult(_ mathFn: (Int, Int) -> Int, _ a: Int, _ b: Int) {
     print("result: \(mathFn(a, b))")
 }
 printResult(sum(v1:v2:), 5, 2)
 printResult(difference(v1:v2:), 5, 2)

 //函数类型作为函数返回值
 func next(_ input:Int) -> Int {
     input + 1
 }

 func previous(_ input:Int) -> Int {
     input - 1
 }

 //forward函数，(Int) -> Int是他的返回类型
 //返回值是函数类型的函数，称为高阶函数
 func forward(_ forward:Bool) -> (Int) -> Int {
     forward ? next : previous
 }
 forward(true)(3)
 forward(false)(3)
 */


/**
 //类型起别名
 //typealias用来给类型起别名
 typealias Byte = Int8
 typealias Short = Int16
 typealias Long = Int64

 typealias Date = (year:Int,month:Int,day:Int)
 func dateTest(_ date:Date) {
     print(date)
 }
 dateTest((2020,9,17))
 dateTest((2020,2,14))


 typealias IntFn = (Int, Int) -> Int
 func difference(v1: Int, v2: Int) -> Int {
     v1 - v2
 }
 let fn: IntFn = difference(v1:v2:)
 fn(20,10)

 func setFn(_ fn: IntFn) { }
 setFn(difference(v1:v2:))

 func getFn() -> IntFn { difference(v1:v2:) }
 getFn()

 //按照swift标准库的定义，Void就是空元组()
 public typealias Void = ()
 */


//嵌套函数
//将函数定义在函数内部
func forward(_ forward: Bool) -> (Int) -> Int {
    func next(_ input: Int) -> Int {
        input + 1
    }
    func previous(_ input: Int) -> Int {
        input - 1
    }
    return forward ? next(_:) : previous(_:)
}
forward(true)(3)
forward(false)(4)
