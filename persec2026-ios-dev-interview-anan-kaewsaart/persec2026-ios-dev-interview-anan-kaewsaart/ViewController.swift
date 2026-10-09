//
//  ViewController.swift
//  persec2026-ios-dev-interview-anan-kaewsaart
//
//  Created by Anan on 9/10/2569 BE.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - ข้อ 1: ตรวจสอบวงเล็บครบคู่
        print("--- ข้อ 1: Bracket Matching ---")
        let testBrackets = ["()", "([{)", "([{}])", "([[{}])))", ")", "(]}]", "([)]", "{"]
        for s in testBrackets {
            print("\"\(s)\" => \(isValidBrackets(s))")
        }
        
        // MARK: - ข้อ 2: Natural Sort
        print("\n--- ข้อ 2: Natural Sorting ---")
        let list1 = ["TH19", "SG20", "TH2"]
        let list2 = ["TH10", "TH3Netflix", "TH1", "TH7"]
        print("\(list1) => \(naturalSort(list1))")
        print("\(list2) => \(naturalSort(list2))")
        
        // MARK: - ข้อ 3: Autocomplete
        print("\n--- ข้อ 3: Autocomplete ---")
        let items = ["Mother", "Think", "Worthy", "Apple", "Android"]
        let resultAuto = autocomplete(search: "th", items: items, maxResult: 2)
        print("search: \"th\", items: \(items), maxResult: 2")
        print("=> \(resultAuto)")
        
        // MARK: - ข้อ 4: Roman Numerals
        print("\n--- ข้อ 4: Roman Numerals ---")
        let numbers = [1989, 2000, 68, 109]
        print("[Int -> Roman]")
        for num in numbers {
            print("\(num) => \(intToRoman(num))")
        }
        
        let romanStrings = ["MCMLXXXIX", "MM", "LXVIII", "CIX"]
        print("[Roman -> Int]")
        for r in romanStrings {
            print("\(r) => \(romanToInt(r))")
        }
        
        // MARK: - ข้อ 5: เรียงตัวเลขจากมากไปน้อย
        print("\n--- ข้อ 5: Sort Digits Descending ---")
        let testDigits = [3008, 1989, 2679, 9163]
        for d in testDigits {
            print("\(d) => \(sortDigitsDescending(d))")
        }
        
        // MARK: - ข้อ 6: Tribonacci
        print("\n--- ข้อ 6: Tribonacci ---")
        print("f([1, 3, 5], 5) => \(tribonacci([1, 3, 5], 5))")
        print("f([2, 2, 2], 3) => \(tribonacci([2, 2, 2], 3))")
        print("f([10, 10, 10], 4) => \(tribonacci([10, 10, 10], 4))")
    }

    func isValidBrackets(_ s: String) -> Bool {
        var stack: [Character] = []
        let pairs: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else if let matchingOpen = pairs[char] {
                if stack.isEmpty || stack.removeLast() != matchingOpen {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
    
    func naturalSort(_ items: [String]) -> [String] {
        return items.sorted { lhs, rhs in
            lhs.localizedStandardCompare(rhs) == .orderedAscending
        }
    }
    
    func autocomplete(search: String, items: [String], maxResult: Int) -> [String] {
        guard maxResult > 0, !search.isEmpty else { return [] }
        
        let query = search.lowercased()
        
        enum MatchPosition: Int {
            case prefix = 1
            case middle = 2
            case suffix = 3
        }
        
        var matches: [(item: String, position: MatchPosition)] = []
        
        for item in items {
            let lowerItem = item.lowercased()
            guard let range = lowerItem.range(of: query) else { continue }
            
            let isAtStart = (range.lowerBound == lowerItem.startIndex)
            let isAtEnd = (range.upperBound == lowerItem.endIndex)
            
            let position: MatchPosition
            if isAtStart {
                position = .prefix
            } else if isAtEnd {
                position = .suffix
            } else {
                position = .middle
            }
            
            matches.append((item, position))
        }
        
        let sortedMatches = matches.sorted { $0.position.rawValue < $1.position.rawValue }
        
        return Array(sortedMatches.map { $0.item }.prefix(maxResult))
    }
    
    func intToRoman(_ num: Int) -> String {
        let mapping: [(value: Int, symbol: String)] = [
            (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
            (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
            (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
        ]
        
        var number = num
        var result = ""
        
        for entry in mapping {
            while number >= entry.value {
                result += entry.symbol
                number -= entry.value
            }
        }
        
        return result
    }

    func romanToInt(_ s: String) -> Int {
        let values: [Character: Int] = [
            "I": 1, "V": 5, "X": 10, "L": 50,
            "C": 100, "D": 500, "M": 1000
        ]
        
        let chars = Array(s)
        var total = 0
        
        for i in 0..<chars.count {
            guard let currentVal = values[chars[i]] else { continue }
            
            if i + 1 < chars.count, let nextVal = values[chars[i + 1]], currentVal < nextVal {
                total -= currentVal
            } else {
                total += currentVal
            }
        }
        
        return total
    }
    
    func sortDigitsDescending(_ num: Int) -> Int {
        let digits = String(num)
        let sortedDigits = String(digits.sorted(by: >))
        return Int(sortedDigits) ?? num
    }
    
    func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
        guard n > 0 else { return [] }
        if n <= signature.count {
            return Array(signature.prefix(n))
        }
        
        var result = signature

        while result.count < 3 && result.count < n {
            result.append(0)
        }
        
        while result.count < n {
            let count = result.count
            let nextValue = result[count - 1] + result[count - 2] + result[count - 3]
            result.append(nextValue)
        }
        
        return result
    }
}

