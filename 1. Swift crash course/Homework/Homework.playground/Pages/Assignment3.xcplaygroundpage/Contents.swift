import Foundation

protocol SoundProducer {
    // Emit some characteristic sound
    func emitSound() -> String
}

protocol LegsOwner {
    var numberOfLegs: Int { get }
}

protocol Animal: SoundProducer, LegsOwner {
    // Name of the animal
    var name: String { get set }
}

protocol Farmer {
    // Name of the farmer
    var name: String { get set }
}

protocol Farm {
    // Get list of all animals on the farm
    var animals: [Animal] { get }
    
    // Count legs for all animals on the farm
    var numberOfLegs: Int { get }
    
    // Get or set a farmer
    var farmer: Farmer? { get set }
    
    // Add animal to the farm
    mutating func add(animal: Animal)
    
    // Make all animals to emit sound
    func makeNoise() -> [String]
}

struct MyFarm: Farm{
    var animals: [Animal] = []
    var numberOfLegs: Int = 0
    var farmer: Farmer?
    mutating func add(animal: Animal) {
        animals.append(animal)
        numberOfLegs+=animal.numberOfLegs
    }
    func makeNoise() -> [String] {
        var noises: [String] = []
        for animal in animals{
            noises.append(animal.emitSound())
        }
        return noises
    }
    init(){
    }
}

struct MyFarmer: Farmer{
    var name: String
}

struct Chicken: Animal{
    var name: String
    func emitSound() -> String {
        return "Kokodak"
    }
    let numberOfLegs: Int = 2
}

struct Dog: Animal{
    var name: String
    func emitSound() -> String {
        return "Haf"
    }
    let numberOfLegs: Int = 4
}

struct Cat: Animal{
    var name: String
    func emitSound() -> String {
        return "Mnau"
    }
    let numberOfLegs: Int = 4
}

// THIS PART OF CODE MUST WORK WHEN IT IS UNCOMMENTED

var farm = MyFarm()

var farmer = MyFarmer(name: "Joe")
farm.farmer = farmer

let chicken = Chicken(name: "Pipi")
let dog = Dog(name: "Ferda")
let cat = Cat(name: "Micka")

farm.add(animal: chicken)
farm.add(animal: dog)
farm.add(animal: cat)

farm.farmer?.name = "Jack"
farmer.name = "Tom"

farm.numberOfLegs == 10 // MUST BE TRUE

farm.farmer?.name == "Jack" // MUST BE TRUE

farm.makeNoise() == ["Kokodak", "Haf", "Mnau"] // MUST BE TRUE

