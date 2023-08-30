import UIKit

//: # Home Work 7

/*:
 ## Задание 1

 1. Создайте класс `Student`. В этом классе должны быть следующие свойства:
    - `name: String`: Имя студента. Это свойство должно быть инициализировано при создании объекта класса.
    - `age: Int`: Возраст студента. Это свойство также должно быть инициализировано при создании объекта класса.
    - `grades: [Int]`: Оценки студента.
    - `averageGrade: Double`: Средний балл студента. Это свойство должно быть геттером.
    - `description: String`: Статус студента. Это свойство должно быть геттером и возращать следующее значение: "<имя>: <средний бал>, <статус>"

 2. В классе должен быть метод `getStatus`, который возвращает статус студента на основе его среднего балла. Правила следующие:
    - Если средний балл 0, то статус - "New".
    - Если средний балл между 1 и 3, то статус - "Underperforming".
    - Если средний балл между 4 и 6, то статус - "Average".
    - Если средний балл между 7 и 8, то статус - "Good".
    - Если средний балл между 9 и 10, то статус - "Excellent".

 3. В классе должен быть метод `addGrade`, который добавляет оценку к списку оценок студента.
 
 У класса должен быть согласованный и логичный интерфейс. Не забывайте про инкапсуляцию.

 Проверьте ваш код, создав несколько объектов класса `Student` и вызывая метод `addGrade()` для добавления оценок. Выведите на экран имя студента, его средний балл и статус.

 **Бонусное задание:**
 Создайте класс `Classroom` со свойством `students`, представляющим собой массив объектов класса `Student`. Реализуйте метод `addStudent` для добавления студентов в список. Так же реализуйте метод `getAverageGrade()`, который вычисляет средний балл всех студентов в классе.
 
 Предусмотрите возможность создания экземпляра класса, как с пустым списком учеников, так и с возможностью передать готовый список в инициализатор.
 
 */
class Student {
    
    var name: String
    var age: Int
   
    private var grades: [Int] = []
    
    var averageGrade: Double {
        var sum = 0
        for grade in grades {
            sum += grade
        }
        return Double(sum) / Double(grades.count)
    }

    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func getStatus() -> String {
        var status = ""
        
        switch averageGrade {
        case 0.0:
            status = "New"
        case  (1.0...3.0):
            status = "Underperforming"
        case (4.0...6.0):
            status = "Average"
        case (7.0...8.0):
            status = "Good"
        case (9.0...10.0):
            status = "Excellent"
        default :
            "Error"
        }
        return status
    }
    
    
    var description: String {
        return "\(name): \(averageGrade), \(getStatus())"
    }
    
    func addGrade(_ mark: Int){
        grades.append(mark)
    }
}

let firstStudent = Student(name: "Anna", age: 19)
firstStudent.addGrade(9)
firstStudent.addGrade(8)
firstStudent.addGrade(10)
firstStudent.description


let secondStudent = Student(name: "John", age: 18)
secondStudent.addGrade(7)
secondStudent.addGrade(8)
secondStudent.addGrade(6)
secondStudent.description


class Classroom {
    private var students: [Student] = []
    
    func addStudent(_ student: Student) {
            students.append(student)
    }
    
    private func getAverageGrade(grade: [Student]) -> Double {
        var sum = 0.0
        for student in students{
            sum += student.averageGrade
            }
        return sum / Double(students.count)
        }
    
        var describtion: String {
            return "Средний балл в классе: \(getAverageGrade(grade: students))"
    }
    
//    init(students: [Student]){
//        self.students = students
//    } не поняла как предусмотреть инициализацию с готовым списком и с пустым
    
  
}

let myClassRoom = Classroom()
myClassRoom.addStudent(firstStudent)
myClassRoom.addStudent(secondStudent)

let thirdStudent = Student(name: "Elena", age: 16)
thirdStudent.addGrade(8)
thirdStudent.addGrade(5)
thirdStudent.description

myClassRoom.addStudent(thirdStudent)

myClassRoom.describtion






/*:
 ## Задание 2
 2.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:
 
 - `salary`
 
 - `name`
 
 - `surname`
 */
class Employee {
    var salary : Int
    var name : String
    var surname : String
    
    init(name: String, surname: String, salary: Int){
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}


 
//: 2.2 Создайте массив `names` со следующими именами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` со следующими фамилиями: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*. Массивы должны быть созданы вне класса.
let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]


//: 2.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*
var employees: [Employee] = []

for _ in 1...10 {
    let randomName = names.randomElement() ?? ""
    let randomSurname = surnames.randomElement() ?? ""
    let randomSalary = Int.random(in: 1000...2000)
    let newEmployeer = Employee(name: randomName, surname: randomSurname, salary: randomSalary)
    employees.append(newEmployeer)
}

//: 2.4 Переберите массив `employees` и выведите информацию по каждому сотруднику в виде: «<имя> <фамилия>’s salary is $<... >»
employees.map {print("\($0.name) \($0.surname)'s salary is $ \($0.salary)")}


//: 2.5 Создайте еще один массив на основе `employees`, который включает только тех работников, чья зарплата чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 2.4
var newArrayEmployeesEven = employees.filter {$0.salary % 2 == 0}
newArrayEmployeesEven.map {print("\($0.name) \($0.surname)'s salary is $ \($0.salary)")}

