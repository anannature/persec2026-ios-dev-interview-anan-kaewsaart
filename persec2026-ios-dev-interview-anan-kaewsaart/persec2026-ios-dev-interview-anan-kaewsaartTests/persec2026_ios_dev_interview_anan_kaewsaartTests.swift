//
//  persec2026_ios_dev_interview_anan_kaewsaartTests.swift
//  persec2026-ios-dev-interview-anan-kaewsaartTests
//
//  Created by Anan on 9/10/2569 BE.
//

import Testing
@testable import persec2026_ios_dev_interview_anan_kaewsaart

struct persec2026_ios_dev_interview_anan_kaewsaartTests {

    // MARK: - ข้อ 1: วงเล็บครบคู่ (Bracket Matching)
    @Test func testValidBrackets() {
        #expect(isValidBrackets("()") == true)
        #expect(isValidBrackets("([{)") == false)
        #expect(isValidBrackets("([{}])") == true)
        #expect(isValidBrackets("([[{}])))") == false)
        #expect(isValidBrackets(")") == false)
        #expect(isValidBrackets("(]}]") == false)
        #expect(isValidBrackets("([)]") == false)
        #expect(isValidBrackets("{") == false)
    }

    // MARK: - ข้อ 2: จัดเรียงข้อความปนตัวเลข
    @Test func testNaturalSort() {
        #expect(naturalSort(["TH19", "SG20", "TH2"]) == ["SG20", "TH2", "TH19"])
        #expect(naturalSort(["TH10", "TH3Netflix", "TH1", "TH7"]) == ["TH1", "TH3Netflix", "TH7", "TH10"])
    }

    // MARK: - ข้อ 3: ค้นหาคำแนะนำ
    @Test func testAutocomplete() {
        let items = ["Mother", "Think", "Worthy", "Apple", "Android"]
        #expect(autocomplete(search: "th", items: items, maxResult: 2) == ["Think", "Mother"])
    }

    // MARK: - ข้อ 4: แปลงเลขโรมัน
    @Test func testRomanNumerals() {
        // Int -> Roman
        #expect(intToRoman(1989) == "MCMLXXXIX")
        #expect(intToRoman(2000) == "MM")
        #expect(intToRoman(68) == "LXVIII")
        #expect(intToRoman(109) == "CIX")

        // Roman -> Int
        #expect(romanToInt("MCMLXXXIX") == 1989)
        #expect(romanToInt("MM") == 2000)
        #expect(romanToInt("LXVIII") == 68)
        #expect(romanToInt("CIX") == 109)
    }

    // MARK: - ข้อ 5: เรียงตัวเลขจากมากไปน้อย
    @Test func testSortDigitsDescending() {
        #expect(sortDigitsDescending(3008) == 8300)
        #expect(sortDigitsDescending(1989) == 9981)
        #expect(sortDigitsDescending(2679) == 9762)
        #expect(sortDigitsDescending(9163) == 9631)
    }

    // MARK: - ข้อ 6: หาค่า Tribonacci
    @Test func testTribonacci() {
        #expect(tribonacci([1, 3, 5], 5) == [1, 3, 5, 9, 17])
        #expect(tribonacci([2, 2, 2], 3) == [2, 2, 2])
        #expect(tribonacci([10, 10, 10], 4) == [10, 10, 10, 30])
        #expect(tribonacci([1], 1) == [1])
        #expect(tribonacci([], 0) == [])
    }
}
