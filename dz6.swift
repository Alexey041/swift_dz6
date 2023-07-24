/* Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар.
Добавить в класс пиццерии массив с работниками */

protocol MenuProtocol {
    var name: String {get}
    var price: Double {get}
}

struct Fries: MenuProtocol {
    var name: String
    var price: Double
    var size: String
}

struct Pizza: MenuProtocol {
    var name: String
    var price: Double
}

struct PizzeriaEmployees {
    enum Post {
        case cashier
        case cook
    }    

    var name: String
    var salary: Double
    var post: Post
}

class Pizzeria {
    private var menu: [MenuProtocol]
    private var employees: [PizzeriaEmployees]

    init(menu: [MenuProtocol], employees: [PizzeriaEmployees]) {
        self.menu = menu
        self.employees = employees
    }

    func addNew(_ new: MenuProtocol){
        menu.append(new)
    }

    func getAvailablePizza() {
        print(menu)
    }    
}

/* Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить,
а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задается в инициализаторе */

class Table {
    private var places: Int

    
    init(places: Int) {
        self.places = 5
    }

    
    func enougSpace(visitors: Int) -> Bool {
        
        if visitors <= places {
            return true
        }else{
            return false
        }
    }
      
}

/* Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик.
Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра */

class PizzeriaName {
    weak var pizzeriaName: Pizzeria?
    private var name: String

    init(name: String){
        self.name = name
    }
}

class Pizzeria {

    private var tables: [Table]
    private var pizzeriaName: PizzeriaName

    init(pizzeriaName: PizzeriaName) {
        self.pizzeriaName = pizzeriaName
        tables = [Table(places: 5, pizzeriaBelongs: pizzeriaName), Table(places: 51, pizzeriaBelongs: pizzeriaName)]
    }
    
    func getTables(){
        for table in tables{
            print(table)
        }    
    }

}

class Table {
    private var places: Int
    private var pizzeriaBelongs: PizzeriaName
    
    init(places: Int, pizzeriaBelongs: PizzeriaName) {
        self.places = places
        self.pizzeriaBelongs = pizzeriaBelongs
    }
}
var pizzeriaName1 = PizzeriaName(name: "First")
var pizzeria1 = Pizzeria(pizzeriaName: pizzeriaName1)
pizzeria1.getTables()


