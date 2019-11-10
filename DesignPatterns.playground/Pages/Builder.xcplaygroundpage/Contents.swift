/*:
 
 Allows you to produce different types and representations of an object using the same construction code.
 
 The pattern organize object construction into a ser of steps.
 
 To create an object, you execute a series of these steps on a builder object.
 
 The important part is that you dont need to call all steps. You call just neccessary ones.
 */

protocol Builder {
    func produceFrontEndDeveloper()
    func produceMobileDeveloper()
    func produceBackendDeveloper()
    func produceSecurityDeveloper()
}

class CompanyBuilder: Builder {
    
    var company = Company()
    
    func reset() {
        company = Company()
    }
    
    func getDevelopers() -> [Developer] {
        return company.developers
    }
    
    func produceFrontEndDeveloper() {
        company.addEmployee(Developer(name: "-", surname: "-", job: .frontEnd))
    }
    
    func produceMobileDeveloper() {
        company.addEmployee(Developer(name: "-", surname: "-", job: .mobile))
    }
    
    func produceBackendDeveloper() {
        company.addEmployee(Developer(name: "-", surname: "-", job: .backend))
    }
    
    func produceSecurityDeveloper() {
        company.addEmployee(Developer(name: "-", surname: "-", job: .security))
    }
}

struct Company {
    var name = "BUTech"
    var developers: [Developer] = []
    
    mutating func addEmployee(_ developer: Developer) {
        developers.append(developer)
    }
}

struct Developer {
    var name: String
    var surname: String
    var job: Job
    
    enum Job {
        case frontEnd
        case mobile
        case backend
        case security
    }
}

class Investor {
    
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    func buildFullTeam() {
        builder?.produceFrontEndDeveloper()
        builder?.produceMobileDeveloper()
        builder?.produceBackendDeveloper()
        builder?.produceSecurityDeveloper()
    }
    
    func buildMobileTeam() {
        builder?.produceMobileDeveloper()
        builder?.produceBackendDeveloper()
        builder?.produceSecurityDeveloper()
    }
}

class Client {
    
    static func buildAFullTeam(investor: Investor) {
        let builder = CompanyBuilder()
        investor.update(builder: builder)
        
        investor.buildFullTeam()
        print(builder.getDevelopers())
    }
    
    static func buildRandomTeam() {
        let builder = CompanyBuilder()
        builder.produceBackendDeveloper()
        builder.produceFrontEndDeveloper()
        
        print(builder.getDevelopers())
    }
}

Client.buildAFullTeam(investor: Investor())
Client.buildRandomTeam()
