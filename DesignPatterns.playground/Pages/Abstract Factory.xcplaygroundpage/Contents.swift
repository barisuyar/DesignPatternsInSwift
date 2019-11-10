/*:
 
 Lets you produce families of related objects without specifying their concrete classes.
 
 */

protocol Playground {
    var dimension: (length: Int, width: Int) { get }
}

protocol Ball {
    var circumference: Int { get }
    var weight: Int { get }
}


struct Football_Ball: Ball {
    
    var circumference: Int {
        return 68
    }
    
    var weight: Int {
        return 430
    }
}

struct Basketball_Ball: Ball {
    
    var circumference: Int {
        return 75
    }
    
    var weight: Int {
        return 567
    }
}

struct FootballPitch: Playground {
    var dimension: (length: Int, width: Int) {
        return (length: 105, width: 64)
    }
}

struct BasketballPitch: Playground {
    var dimension: (length: Int, width: Int) {
        return (length: 28, width: 15)
    }
}

protocol EventProvider {
    func createBall() -> Ball
    func createPlayground() -> Playground
}

struct FootballProvier: EventProvider {
    func createBall() -> Ball {
        return Football_Ball()
    }
    
    func createPlayground() -> Playground {
        return FootballPitch()
    }
}

struct BasketballProvider: EventProvider {
    func createBall() -> Ball {
        return Basketball_Ball()
    }
    
    func createPlayground() -> Playground {
        return BasketballPitch()
    }
}

struct Organizer {
    enum Event {
        case football
        case basketball
    }
    
    private var event: Event
    private var provider: EventProvider!
    
    init(_ event: Event) {
        self.event = event
        self.provider = (event == .football ? FootballProvier() : BasketballProvider())
    }
    
    func buildBall() -> Ball {
        return provider.createBall()
    }
    
    func buildPlayground() -> Playground {
        return provider.createPlayground()
    }
}

var org = Organizer(.football)
print(org.buildBall())
print(org.buildPlayground())

org = Organizer(.basketball)
print(org.buildBall())
print(org.buildPlayground())

