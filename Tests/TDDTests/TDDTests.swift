import XCTest
@testable import TDD

class TDDTests: XCTestCase {
    func testMultiplication() {
        let five: Money = Money.dollar(amount: 5)
        XCTAssertEqual(Money.dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Money.dollar(amount: 15), five.times(multiplier: 3))
    }
    
    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 5) ==  Money.dollar(amount: 5))
        XCTAssertFalse(Money.dollar(amount: 5) == Money.dollar(amount: 6))
        XCTAssertTrue(Money.franc(amount: 5) ==  Money.franc(amount: 5))
        XCTAssertFalse(Money.franc(amount: 5) == Money.franc(amount: 6))
        
        XCTAssertFalse(Money.franc(amount: 5) == Money.dollar(amount: 5))
    }
    
    func testFrancMultiplication() {
        let five = Money.franc(amount: 5)
        
        XCTAssertEqual(Money.franc(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Money.franc(amount: 15), five.times(multiplier: 3))
    }
}
