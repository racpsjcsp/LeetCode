import Foundation


func arraySum(ar: [Int]) -> Int {
//    return ar.reduce(0, +)
    var total = 0
    for n in ar {
        total += n
    }
    return total
}
//arraySum(ar: [1,2,3,4,10,11])

func aVeryBigSum(ar: [Int]) -> Int {
    return ar.reduce(0, +)
}
//aVeryBigSum(ar: [1000000001, 1000000002, 1000000003, 1000000004, 1000000005])

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var ana = 0
    var bob = 0
    for i in 0...2 {
        if a[i] > b[i] {
            ana += 1
        } else if a[i] < b[i] {
            bob += 1
        }
    }
    return [ana, bob]
}
//compareTriplets(a: [17,28,30], b: [99,16,8])

func diagonalDifference(arr: [[Int]]) -> Int {
    var leftDiagonal = [Int]()
    var rightDiagonal = [Int]()
    for (index, i) in arr.enumerated() {
        leftDiagonal.append(i[index])
    }
    for (index, i) in arr.reversed().enumerated() {
        rightDiagonal.append(i[index])
    }
    let leftTotal = leftDiagonal.reduce(0, +)
    let rightTotal = rightDiagonal.reduce(0, +)
    return abs(leftTotal - rightTotal)
}
//diagonalDifference(arr: [[1,2,3], [4,5,6], [9,8,9]])
//diagonalDifference(arr: [[11,2,4], [4,5,6], [10,8,-12]])

func plusMinus(arr: [Int]) -> Void {
    let size = Double(arr.count)
    var posit = 0.0
    var negat = 0.0
    var neutr = 0.0
    for i in arr {
        print(i)
        if i > 0 {
            posit += 1
        } else if i < 0 {
            negat += 1
        } else {
            neutr += 1
        }
    }
    print(String(format: "%f", posit/size))
    print(String(format: "%f", negat/size))
    print(String(format: "%f", neutr/size))
}
//plusMinus(arr: [-4,3,-9,0,4,1])

func staircase(n: Int) -> Void {
    for i in stride(from: 0, to: n+1, by: +1) {
        if i == 0 {
            continue
        }
        print("\(String(repeating: " ", count: n-i))\(String(repeating: "#", count: i))")
    }
}
//staircase(n: 6)

func minMaxSum(arr: [Int]) -> Void {
    var sortedArr = arr.sorted()
    var totalMin = 0
    var totalMax = 0
    totalMin = sortedArr.dropLast().reduce(0, +)
    totalMax = sortedArr.dropFirst().reduce(0, +)
    print(totalMin, totalMax)
}
//minMaxSum(arr: [1,3,5,7,9])

func birthdayCakeCandles(candles: [Int]) -> Int {
    var candleArr = candles
    var maxVal = 0
    var count = 0
    for val in candleArr.sorted().reversed() {
        if val >= maxVal {
            maxVal = val
            count += 1
        }
    }
    return count
}
//birthdayCakeCandles(candles: [18,90,90,13,90,75,90,8,90,43])

func timeConversion(s: String) -> String {
    guard let first = s.first else { return "" }
    guard let second = s.dropFirst().first else { return "" }
    guard let firstTwoDigits = Int("\(first)\(second)") else { return "" }
    
    var amTime = s.dropLast(2)
    if s.contains("AM") {
        if firstTwoDigits == 12 {
            return "0\(firstTwoDigits-12)\(amTime.dropFirst(2))"
        }
        return "\(amTime)"
    }
    
    var pmTime = s.dropLast(2)
    if s.contains("PM") {
        if firstTwoDigits < 12 {
            return "\(firstTwoDigits+12)\(amTime.dropFirst(2))"
        }
        return "\(pmTime)"
    }
    return ""
}
//timeConversion(s: "12:01:00AM")
//timeConversion(s: "23:05:45PM")


func test(string: String) {
    var charCounts = [Character: Int]()
    for char in string {
        if charCounts[char] != nil {
            charCounts[char]! += 1
        } else {
            charCounts[char] = 1
            print(char)
        }
    }
    print(charCounts)
    
    let answer = charCounts.sorted {$0.key < $1.key}.min(by: { $0.value < $1.value })?.key
    
    print(answer!)
}

//test(string: "aabcdebdfe")

/// map(), flatMap(), compactMap()
//let numbers = [1, 2, 3, 4, 5]
//let doubled = numbers.map { $0 * 2 }
//print("without .map: \(numbers)")
//print("with .map: \(doubled)")
//
//let optionalNumbers = [1, 2, 3, 4, 5, nil]
//let optionalDoubled = optionalNumbers.compactMap { $0 }
//print("without .compactMap: \(optionalNumbers)")
//print("with .compactMap: \(optionalDoubled)")
//
//let numberArrays = [[1, 2, 3], [4, 5], [6, 7, 8], ["abc", "def"]]
//let numberArray = numberArrays.flatMap { $0 }
//print("without .flatMap: \(numberArrays)")
//print("with .flatMap: \(numberArray)")
//
//let joinedArray = numberArrays.map { $0 }.joined()
//print("with .map + .joined: \(joinedArray)")

///weak self - clojure
//class MyClass {
//    var closure: (() -> Void)?
//
//    func setupClosure() {
//        closure = { [weak self] in
//            self?.doSomething()
//        }
//    }
//
//    func doSomething() {
//        print("Did something")
//    }
//
//    deinit {
//        print("Deinitialized")
//    }
//}
//
//var obj: MyClass? = MyClass()
//obj?.setupClosure()
//obj = nil // Deinitialized will not be printed

/////ARC
//class MyClass {
//    var name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: MyClass?
//var reference2: MyClass?
//var reference3: MyClass?
//
//reference1 = MyClass(name: "ARC Tutorial")
//// Prints "ARC Tutorial is being initialized"
//
//reference2 = reference1
//reference3 = reference1
//
//reference1 = nil
//reference2 = nil
//
/////until reference3 is set to nil, it will hold reference and retain cycle
//reference3 = nil
//// Prints "ARC Tutorial is being deinitialized"


func containsDuplicate(nums: [Int]) -> Bool {
    for i in nums {
        if nums.contains(i) {
            return true
        }
    }

    return false
}

//containsDuplicate(nums: [1,2,3,1])

///Binary Tree
//class Node {
//    public var val: Int
//    public var left: Node?
//    public var right: Node?
//    public init() {
//        self.val = 0
//        self.left = nil
//        self.right = nil
//
//    }
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//    public init(_ val: Int, _ left: Node?, _ right: Node?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
//
//class BinaryTree {
//    var root: Node?
//
//    func binaryTree(root: Node) {
//        self.root = root
//    }
//}
//
//
//class BasicBinaryTree {
//    var one: Node!
//    var two: Node!
//    var three: Node!
//    var four: Node!
//    var five: Node!
//    var six: Node!
//    var seven: Node!
//
//    init(one: Node = Node(1), two: Node = Node(2), three: Node = Node(3), four: Node = Node(4), five: Node = Node(5), six: Node = Node(6), seven: Node = Node(7)) {
//        self.one.left = two
//        self.one.right = three
//
//        self.two.left = four
//
//        self.three.left = five
//        self.three.right = six
//
//        self.five.right = seven
//    }
//}

func addStrings(_ num1: String, _ num2: String) -> String {
    var n1 = UInt64(num1) ?? 0
    var n2 = UInt64(num2) ?? 0
    let sum: String = "\(n1+n2)"
    return sum
}

//addStrings("387662062380149417", "652936452380268477")



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    LeetCode often uses inout parameter. The parameter will be mutated to store                     //////////////////////////////////////////////////////////////////////////// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
 https://leetcode.com/problems/merge-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
 */
func merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var ans = [Int]()
    var numCount = 0

    for int in nums1 {
        if numCount < m {
            ans.append(int)
            numCount += 1
        }
    }

    numCount = 0
    for int in nums2 {
        if numCount <= n {
            ans.append(int)
            numCount += 1
        }
    }

    var ansCount = ans.count
    var finalAnswer = [Int]()
    for (index, int) in ans.enumerated() {
        if index >= m+n {
            break
        }

        finalAnswer.append(int)
    }
    ///answer for LeetCode because it uses pointer (inout)
    ///nums1 = finalAnswer.sorted()
}

//merge([1,2,3,0,0,0], 3, [2,5,6], 3)
//merge([1], 1, [], 0)
//merge([0], 0, [1], 1)
//merge([0,0,0,0,0], 0, [1,2,3,4,5], 5)
//merge([-1,0,0,3,3,3,0,0,0], 6, [1,2,2], 3)


/*
 https://leetcode.com/problems/remove-element/description/?envType=study-plan-v2&envId=top-interview-150
 */
func removeElement(_ nums: [Int], _ val: Int) -> Int {
    var tempNums = nums
    tempNums.removeAll { $0 == val }
    return tempNums.count
}

//removeElement([3,2,2,3], 3)


/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-array/?envType=study-plan-v2&envId=top-interview-150
 */
func removeDuplicates(_ nums: [Int]) -> Int {
    var tempNums = Set(nums.sorted())
    return tempNums.count
}

//removeDuplicates([1,1,2])


/*
 https://leetcode.com/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150
 */
func majorityElement(_ nums: [Int]) -> Int {
    let countedSet = NSCountedSet(array: nums)
    let majority = countedSet.max { countedSet.count(for: $0) < countedSet.count(for: $1) }
    guard let ans = majority as? Int else { return 0 }
    return ans
}

//majorityElement([3,2,3])
//majorityElement([2,2,1,1,1,2,2])

/*
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?envType=study-plan-v2&envId=top-interview-150
 */
func maxProfit(_ prices: [Int]) -> Int {
    if prices == prices.reversed() {
        return 0
    }

    var low = Int.max
    var maxProfit = 0

    for price in prices {
        if price < low {
            low = price
        } else if price - low > maxProfit {
            maxProfit = price - low
        }
    }
    return maxProfit
}

//maxProfit([7,1,5,3,6,4])
//maxProfit([2,4,1])

/*
 https://leetcode.com/problems/length-of-last-word/description/?envType=study-plan-v2&envId=top-interview-150
 */
func lengthOfLastWord(_ s: String) -> Int {
    let words = s.split(separator: " ")
    guard let count = words.last?.count else { return 0 }
    return count
}

//lengthOfLastWord("Hello World Test")

/*
 https://leetcode.com/problems/longest-common-prefix/description/?envType=study-plan-v2&envId=top-interview-150
 */
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty {
        return ""
    }

    var prefix = (strs.min(by: { $0.count < $1.count }))!

    for i in 0..<strs.count {
        while !strs[i].hasPrefix(prefix) {
            prefix = String(prefix.dropLast())
        }
    }

    return prefix
}

//longestCommonPrefix(["flower, flow, flight"])

/*
 https://leetcode.com/problems/valid-palindrome/?envType=study-plan-v2&envId=top-interview-150
 */
func isPalindrome(_ s: String) -> Bool {
    return true
}

//isPalindrome("A man, a plan, a canal: Panama")
//isPalindrome("race a car")
//isPalindrome(" ")

class Bank {
    var balance: [Int]

    init(balance: [Int]) {
        self.balance = balance
    }

    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        if account1 > balance.count || account2 > balance.count {
            return false
        }

        if balance[account1-1] < money {
            return false
        }

        balance[account1-1] -= money
        balance[account2-1] += money

        return true
    }

    func deposit(_ account: Int, _ money: Int) -> Bool {
        if account > balance.count {
            return false
        }

        balance[account-1]  += money

        return true
    }

    func withdraw(_ account: Int, _ money: Int) -> Bool {
        if account > balance.count {
            return false
        }

        if balance[account-1] < money {
            return false
        }

        balance[account-1] -= money

        return true
    }
}

///Your Bank object will be instantiated and called as such:
//let obj = Bank(balance: [10,100,20,50,30])
//print(obj.balance)
//let ret_0: Bool = obj.withdraw(3, 10)
//let ret_1: Bool = obj.transfer(5, 1, 20)
//let ret_2: Bool = obj.deposit(5, 20)
//let ret_3: Bool = obj.transfer(3, 4, 15)
//print(obj.balance)
//let ret_4: Bool = obj.withdraw(10, 50)
//print(obj.balance)

