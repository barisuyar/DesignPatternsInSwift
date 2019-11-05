/*:
 Provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects will be created.
 
 */

protocol Bonus {
    func giveBonus() -> Double
}

struct Employee {
    var name: String
    var salary: Double
    var ranking: Double
    var job: Job
    
    enum Job {
        case it
        case hr
        case security
    }
}

struct ITHumanResources: Bonus {
    var employee: Employee
    var ratio: Double = 1.5
    
    init(_ employee: Employee) {
        self.employee = employee
    }
    
    func giveBonus() -> Double {
        employee.salary * ratio * employee.ranking
    }
}

struct HRHumanResources: Bonus {
    var employee: Employee
    var ratio: Double = 1
    
    init(_ employee: Employee) {
        self.employee = employee
    }
    
    func giveBonus() -> Double {
        employee.salary * ratio * employee.ranking
    }
}

struct SecurityHumanResources: Bonus {
    var employee: Employee
    var ratio: Double = 1.25
    
    init(_ employee: Employee) {
        self.employee = employee
    }
    
    func giveBonus() -> Double {
        employee.salary * ratio * employee.ranking
    }
}

struct BonusFactory {
    static func getBonus(_ employee: Employee) -> Bonus {
        switch employee.job {
        case .it:
            return ITHumanResources(employee)
        case .hr:
            return HRHumanResources(employee)
        case .security:
            return SecurityHumanResources(employee)
        }
    }
}


var employees = [Employee]()
employees.append(Employee(name: "John", salary: 2000, ranking: 0.8, job: .it))
employees.append(Employee(name: "Cristina", salary: 1500, ranking: 0.7, job: .hr))
employees.append(Employee(name: "Jonathan", salary: 1400, ranking: 0.9, job: .security))

for employee in employees {
    let bonusFactory = BonusFactory.getBonus(employee)
    print(bonusFactory.giveBonus())
}
