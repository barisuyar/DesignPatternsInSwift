/*:
 
 Prototype pattern lets you copy existing object with own values and without making code dependent on their classes.
 
 Suppose you have to copy an existing object, you can directly create a new object and copy existing values to new object.
 
 But the class be able to has private values and not visible from outside.
 
 Solution is that you create a protocol which has a "cloning" method, after that you will conform classes which you want to copy with this protocol.
 
 Classes need a init method with its type because we will use it to copy values from existing object.
 
 */
import Foundation

protocol Prototype {
    func clone() -> Prototype
}

class Employee: Prototype {
    
    var salary: Double = 100  {
        didSet {
            setTaxRatio()
        }
    }
    private var tax_ratio: Double!
    func getNetSalary() -> Double {
        salary * ((100-tax_ratio) / 100)
    }
    
    private func setTaxRatio() {
        switch salary {
        case 0...1000:
            tax_ratio = 5
        case 1001...2500:
            tax_ratio = 10
        case 2501...4000:
            tax_ratio = 12.5
        default:
            tax_ratio = 15
        }
    }
    
    init() {
        
    }
    
    init(_ computer: Employee) {
        self.salary = computer.salary
        self.tax_ratio = computer.tax_ratio
    }
    
    func clone() -> Prototype {
        return Employee(self)
    }
}

var employee = Employee()
employee.salary = 1750

var clone = employee.clone() as! Employee

print(clone.getNetSalary())
