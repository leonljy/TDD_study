class Money {
    fileprivate let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    class func dollar(amount: Int) -> Money {
        return Dollar(amount: amount)
    }
    
    class func franc(amount: Int) -> Money {
        return Franc(amount: amount)
    }
    
    func times(multiplier: Int) -> Money {
        return Money(amount: 0)
    }
}

extension Money: Equatable {
    public static func == (lhs: Money, rhs: Money) -> Bool {
        return (lhs as Money).amount == (rhs as Money).amount && (type(of: lhs) == type(of: rhs))
    }
}

class Dollar: Money {
    override func times(multiplier: Int) -> Money {
        return Dollar(amount: self.amount * multiplier)
    }
}

class Franc: Money {
    override func times(multiplier: Int) -> Money {
        return Franc(amount: self.amount * multiplier)
    }
}

