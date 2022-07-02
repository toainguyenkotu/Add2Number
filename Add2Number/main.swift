import Foundation
//It my test
class MyBigNumber {
    func sum(stringNum1 : String, stringNum2: String) {
        let total = Int(stringNum1)! + Int(stringNum2)!
        
        var charArr1 = Array(stringNum1)
        var charArr2 = Array(stringNum2)
        if(!checkLengthString1IsShorterString2(string1: stringNum1, string2: stringNum2)) {
            charArr1 = Array(stringNum2)
            charArr2 = Array(stringNum1)
        }
        
        if charArr1.count <= charArr2.count {
            let count  = charArr2.count - charArr1.count
            var step = 0
            var rememberNum = 0
            for (index, _) in charArr1.enumerated().reversed() {
                step += 1
                let num1 = Int(String(charArr1[index]))
                let num2 = Int(String(charArr2[index + count]))
                var result = num1! + num2!
                if index != 0 {
                    if result >= 10 {
                        if rememberNum > 0 {
                            result = result + 1
                            rememberNum = result / 10
                            Swift.print("Bước \(step), ta lấy \(num1!) cộng với \(num2!) ta được \(result - rememberNum) nhớ \(rememberNum) là \(result), GHI \(result - 10) nhớ \(rememberNum)")
                        } else {
                            rememberNum = result / 10
                            Swift.print("Bước \(step), ta lấy \(num1!) cộng với \(num2!) ta được \(result), GHI \(result - 10) nhớ \(rememberNum)")
                        }
                        
                    } else {
                        if rememberNum > 0 {
                            Swift.print("Bước \(step), ta lấy \(num1!) cộng với \(num2!) ta được \(result) nhớ \(rememberNum) là \(result + rememberNum)")
                        } else {
                            Swift.print("Bước \(step), ta lấy \(num1!) cộng với \(num2!) ta được \(result), GHI \(result)")
                        }
                        rememberNum = 0
                    }
                } else {
                    if count == 0 {
                        if rememberNum > 0 {
                            Swift.print("Bước cuối cùng, ta lấy \(num1!) cộng với \(num2!) ta được \(result) nhớ \(rememberNum) là \(result + rememberNum)")
                        } else {
                            Swift.print("Bước cuối cùng, ta lấy \(num1!) cộng với \(num2!) ta được \(result)")
                        }
                        Swift.print("Vậy nếu ta lấy \(stringNum1) cộng với \(stringNum2) ta được \(total)")
                    } else {
                        let index = checkLengthString1IsShorterString2(string1: stringNum1, string2: stringNum2) ? stringNum2.index(stringNum2.startIndex, offsetBy: count ) : stringNum1.index(stringNum1.startIndex, offsetBy: count )
                        
                        let subString = String(checkLengthString1IsShorterString2(string1: stringNum1, string2: stringNum2) ? stringNum2[..<index] : stringNum1[..<index])
                        if result >= 10 {
                            if rememberNum > 0 {
                                result = result + rememberNum
                                rememberNum = result / 10
                                Swift.print("Bước tiếp theo, ta lấy \(num1!) cộng với \(num2!) ta được \(result - rememberNum) thêm \(rememberNum) là \(result), GHI \(result - 10) nhớ \(rememberNum)")
                                
                                Swift.print("Còn lại, ta lấy \(subString) nhớ \(rememberNum) là \(Int(subString)! + rememberNum)")
                            } else {
                                rememberNum = result / 10
                                Swift.print("Bước tiếp theo, ta lấy \(num1!) cộng với \(num2!) ta được \(result), GHI \(result - 10) nhớ \(rememberNum)")
                                
                                Swift.print("Còn lại, ta lấy \(subString) nhớ \(rememberNum) là \(Int(subString)! + rememberNum)")
                            }
                        } else {
                            if rememberNum > 0 {
                                Swift.print("Bước tiếp theo, ta lấy \(num1!) cộng với \(num2!) ta được \(result) thêm \(rememberNum) là \(result + rememberNum), GHI \(result + rememberNum)")
                                rememberNum = 0
                                Swift.print("Còn lại, ta lấy \(subString) nhớ \(rememberNum) là \(Int(subString)! + rememberNum)")
                            } else {
                                rememberNum = result / 10
                                Swift.print("Bước tiếp theo, ta lấy \(num1!) cộng với \(num2!) ta được \(result)")
                                
                                Swift.print("Còn lại, ta lấy \(subString) nhớ \(rememberNum) là \(Int(subString)! + rememberNum)")
                            }
                        }
                        Swift.print("Vậy nếu ta lấy \(stringNum1) cộng với \(stringNum2) ta được \(total)")
                    }
                }
            }
        }
    }
    
    func checkLengthString1IsShorterString2 (string1: String, string2: String) -> Bool {
        if string1.count <= string2.count {
            return true
        }
        return false
    }
}

print("Nhấp số lớn:")
let maxNumber = readLine()

print("Nhập số bé:")
let minNumber = readLine()

print("--------- Phép toán cộng ---------")
print(maxNumber!)
let count = maxNumber!.count - minNumber!.count
var stringSpace = ""
for _ in 0..<count {
    stringSpace = stringSpace.appending(" ")
}
print("\(stringSpace)\(minNumber!)")

print("---------------- Các bước làm ----------------")


let myBigNumber = MyBigNumber()
myBigNumber.sum(stringNum1: maxNumber! , stringNum2: minNumber!)
