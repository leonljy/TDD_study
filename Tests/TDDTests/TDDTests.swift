import XCTest
@testable import TDD

class TDDTests: XCTestCase {
    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 5) ==  Money.dollar(amount: 5))
        XCTAssertFalse(Money.dollar(amount: 5) == Money.dollar(amount: 6))
        XCTAssertFalse(Money.franc(amount: 5) == Money.dollar(amount: 5))
    }
}

extension TDDTests {
    func testMultiplication() {
        let five: Money = Money.dollar(amount: 5)
        XCTAssertEqual(Money.dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Money.dollar(amount: 15), five.times(multiplier: 3))
    }
    
    func testSimpleAddition() {
        let five = Money.dollar(amount: 5)
        let sum = five + five
        let bank = Bank()
        let reduced = bank.reduce(source: sum, to: "USD")
        XCTAssertEqual(Money.dollar(amount: 10), reduced)
    }
    
    func testPlusReturnsSum() {
        let five = Money.dollar(amount: 5)
        let result = five + five
        let sum = result as? Sum
        XCTAssertEqual(Optional(five), sum?.augend)
        XCTAssertEqual(Optional(five), sum?.addend)
    }
    
    func testReduceSum() {
        let sum = Sum(augend: Money.dollar(amount: 3), addend: Money.dollar(amount: 4))
        let bank = Bank()
        let result = bank.reduce(source: sum, to: "USD")
        XCTAssertEqual(Money.dollar(amount: 7), result)
    }
    
    func testReduceMoney() {
        let bank = Bank()
        let result = bank.reduce(source: Money.dollar(amount: 1), to: "USD")
        XCTAssertEqual(Money.dollar(amount: 1), result)
    }
}

extension TDDTests {
    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(amount: 1).currency)
        XCTAssertEqual("CHF", Money.franc(amount: 1).currency)
    }
}
