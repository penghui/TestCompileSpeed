//
//  ViewController.swift
//  TestCompileSpeed
//
//  Created by penghui on 2017/11/2.
//  Copyright © 2017年 tuhu. All rights reserved.
//

import UIKit

infix operator ??? : NilCoalescingPrecedence
infix operator ???? : NilCoalescingPrecedence
func ???(_ a: String?, _ b: String) -> String{
    guard let a = a else {return b}
    return a
}
func ????(_ a: Int?, _ b: Int) -> Int{
    guard let a = a else {return b}
    return a
}

class ViewController: UIViewController {
    
    @objc dynamic public let nameLbl = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
//        $0.textColor = UIColor(hex:0x9897a7)
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }
    
    @objc dynamic public let nameLbl2: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
//        $0.textColor = UIColor(hex:0x9897a7)
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ViewController().nameLbl
        ViewController().nameLbl
        nameLbl
        nameLbl
        nameLbl
        ViewController().nameLbl2
        ViewController().nameLbl2
        nameLbl2
        nameLbl2
        nameLbl2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test1() {
        let number = 32
        let string = ""
        let label = UILabel()
        let dict = ["string1":"string","number":10,"label":label] as [String : Any]
        var strings: [String] = []
        ViewController().nameLbl
        ViewController().nameLbl2
    }
    func test2() {
        let number:Int = 32
        let string:String = ""
        let label:UILabel = UILabel()
        let dict:[String:Any] = ["string1":"string","number":10,"label":label] as [String : Any]
        var strings: [String] = [String]()
        ViewController().nameLbl
        ViewController().nameLbl2
    }
    
    func test3() ->Int {
        var number1:Int?
        var number2:Int?
        var number3:Int?
        return 10 + (number1 ?? 0) + (number2 ?? 0) + (number3 ?? 0)
    }
    func test3_1() ->Int {
        var number1:Int?
        var number2:Int?
        var number3:Int?
        let n1 = number1 != nil ? number1! : 0
        let n2 = number2 != nil ? number2! : 0
        let n3 = number3 != nil ? number3! : 0
        return 10 + n1 + n2 + n3
    }
    func test3_2() ->Int {
        var number1:Int?
        var number2:Int?
        var number3:Int?
        let n1 = number1 ?? 0
        let n2 = number2 ?? 0
        let n3 = number3 ?? 0
        return 10 + n1 + n2 + n3
    }
    func test3_3() ->Int {
        var number1:Int?
        var number2:Int?
        var number3:Int?
        return 10 + (number1 ?? 0)! + (number2 ?? 0)! + (number3 ?? 0)!
    }
    func test3_4() ->Int {
        var number1:Int = 0
        var number2:Int = 0
        var number3:Int = 0
        return 10 + (number1 != 0 ? 1 : 0) + (number2 != 0 ? 1 : 0) + (number3 != 0 ? 1 : 0)
    }
    func test3_5() ->Int {
        var number1:Int?
        var number2:Int?
        var number3:Int?
        return 10 + (number1 ???? 0) + (number2 ???? 0) + (number3 ???? 0)
    }
    func test4() ->Int {
        var total = 10
        var number1:Int?
        var number2:Int?
        var number3:Int?
        if let number1 = number1 {
            total = total + number1
        }
        
        if let number2 = number2 {
            total = total + number2
        }
        if let number3 = number3 {
            total = total + number3
        }
        return total
    }
    
    func test5() {
        var arrays = [Int]()
        let arr1 = [1,2,3]
        let arr2 = [3,4,5]
        arrays += arr1 + arr2 + [10]
    }
    func test6() {
        var arrays:[Int] = [Int]()
        let arr1 = [1,2,3]
        let arr2 = [3,4,5]
        arrays.append(contentsOf: arr1)
        arrays.append(contentsOf: arr2)
        arrays.append(contentsOf: [10])
    }
    
    func test7(string1:String,string2:String) {
        let string = string1 + "你好" + string2 + "\(10)"
    }
    func test8(string1:String,string2:String) {
        var string = string1
        string = string + "你好"
        string = string + string2
        string = string + "\(10)"
        
    }
    func test9(string1:String,string2:String) {
        let string = "\(string1)你好\(string2)\(10)"
    }
    
//    func test10() {
//        let hour = 1
//        let hourDelta = 1
//        let minute = 1
//        let minuteDelta = 1
//        let unit = 1
//        return CGFloat(M_PI) * (CGFloat((hour + hourDelta + CGFloat(minute + minuteDelta) / 60) * 5) - 15)
//    }
//
//    func test11() {
//        let hour = 1
//        let hourDelta = 1
//        let minute = 1
//        let minuteDelta = 1
//        let unit = 1
//        return CGFloat(M_PI) * ((hour + hourDelta + (minute + minuteDelta) / 60) * 5 - 15)
//    }
    
    func test12() {
        let a: Double = 1.0
        let b: Double = 1.0
        let c: Double = 1.0
        let d: Double = 1.0
        let e: Double = 1.0
        let expansion = a - b - c + round(d * 0.66) + e
    }
    
    func test13() {
        let a: Double = 1.0
        let b: Double = 1.0
        let c: Double = 1.0
        let d: Double = 1.0
        let e: Double = 1.0
        let expansion = a - b - c + d * 0.66 + e
    }
    


}

