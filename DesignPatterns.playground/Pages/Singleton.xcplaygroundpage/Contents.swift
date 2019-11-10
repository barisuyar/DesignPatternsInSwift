/*:
 
 Lets you ensure that a class has only one instance, while providing a global access point.
 
 Make constructors private, create a static creation method.
 */

class Company {
    
    var name: String
    private var employees: [Employee]
    
    static let shared = Company()
    
    func addEmployee(_ employee: Employee) {
        employees.append(employee)
    }
    
    func getEmployees() -> [Employee] {
        return employees
    }
    
    private init() {
        name = "BUTech"
        employees = []
    }
}

struct Employee {
    var name: String
    var surname: String
    var salary: Double
}

print(Company.shared.getEmployees())

Company.shared.addEmployee(Employee(name: "-", surname: "-", salary: 9999))

print(Company.shared.getEmployees())
