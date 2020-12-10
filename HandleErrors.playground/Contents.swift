import Foundation


// =================================
// MARK: - Task 3B
// =================================

/*
 Перепишите решение задачи 3 из классной работы для выполнения следующих условий:

 1. Ракета не может полететь, если нет экипажа. Всего экипаж - `5 человек`.
    Для работы с экипажем выполните следующие шаги:

    1.1. Создайте еnum Role, который будет описывать обязанности членов экипажа:
            - `Командир`,
            - `Штурман`,
            - `Механик`,
            - `Медик`,
            - `Инженер`,
            - `Повар`,
            - `Стюард/Стюардесса`
            - `Самозванец` (Imposter)
         Каждый член данного перечисления должен содержать `стаж работы` - Int.

    1.2. Реализуйте структуру `Член Экипажа`. Каждый член экипажа имеет:
            - имя (name),
            - роль (role)
            - возраст (age)

    1.3. Реализуйте свойство `Экипаж`, которое будет хратить массив членов экипажа.
         Сделайте это свойство доступным только для чтения.

    1.4. Для посадки каждого члена экипажа реализуйте отдельный метод.

    1.5. Ракета не может полететь, если при подготовке экипажа допущены ошибки.
         Реализуйте обработку следующих ошибок:

            - Если `Командира` и/или `Штурмана` нет на борту, даже если членов экипажа достаточно, ракета не полетит.
              Верните ошибку - какого члена экипажа не хватает.
            - Если не хватает членов экипажа, верните сообщение - сколько члено экипажа не хватает.
            - Если на борту `Самозванец` - ракету запускать нельзя! Верните ошибку!
            - Если стаж хоть одного члена экипажа менее 3х лет. Сообщите Командному центру кто это.

            !!! Для обработки ошибок связанных с членами экипажа, реализуйте enum `RocketStaffError` !!!
            !!! Сообщения об ошибках выводите через `NSLocalizedString` !!!



 2. Оборудуем ракету для перевозки пассажиров.
    Для этого:

    2.1. Создайте структуру `Пассажир`.
         Каждый пассажир имеет:
            - имя (name),
            - пол (gender),
            - возраст (age)
            - массу (weight)

    2.2. Для Ракеты реализуйте приватный массив Пассажиры, который будет принимать объекты типа Пассажир.

    2.3. Реализуйте методы, которые позволят сажать пассажиров на ракету, как группами, так и единичных пассажиров.

    2.2. Ракета может полететь, если:
            - Количество пассажиров не более 10 человек
            - Общая масса пассажиров не более 700 кг
            - Возраст каждого пассажира должен находиться в диапазоне 18 - 55 лет.

    2.3. Реализуйте обработку следующих ошибок:
            - Если возраст любого из пассажиров не соответсвует норме, верните ошибку, а также сообщите, какой пассажир не может полететь
            - Если количество пассажиров не соответсвует норме, верните соответствующую ошибку
            - Если масса всех пассажиров превышает норму, даже если их количество меньше установленной, верните ошибку

        !!! Для обработки ошибок связанных с пассажирами, реализуйте enum RocketPassengerError !!!
        !!! Сообщения об ошибках выводите через NSLocalizedString !!!



 3. Руководство Космопорта решило, что ракета должна перевозить грузы.
    Для этого давайте выполним следующие шаги:

    3.1. Реализуйте структуру `Груз`
         Каждый объект типа `Груз` должен иметь:
            - Название (subject) - String
            - Цель назначения (target) - String?
            - Свойства (properties)

    3.2. Для описания свойств `Груза` реализуйте `enum Properties`, где каждый элемент будет содержать:
            - массу (Float)
            - опастность груза (Bool)

    3.3. Реализуйте закрытое свойство `Грузовой отсек`, который будет хранить наши грузы. Доступно только для чтения.

    3.4. Реализуйте метод загрузки грузов в отсек.

    3.5. Ракета не может полететь, если не выполнены следующие нормы по перевозке грузов:
         - Если общая масса грузов превышает 1000 килограмм, верните ошибку и значение того, на сколько превышен вес.
         - Если на борту содержится хотя бы один опасный груз - при этом выведите все опасные грузы.
         - Если не указана цель назначения.
         - Если название попадает в список запрещенных.
           (Для этого можете создать произвольный список запрещаемых грузов)
           Не учитывайте регистр текста.

        !!! Для обработки ошибок связанных с пассажирами, реализуйте enum RocketCargoError !!!
        !!! Сообщения об ошибках выводите через NSLocalizedString !!!


 4. Предполетная подготовка. Ракета не полетит, если не выполнены требования ниже.
    Для этого придется расширить `RocketError`

    4.1. Вес пассажиров и груза превышает 1700 килограмм.
    4.2. Если ракета содержит топлива менее 5000 литров (не долетит), сообщите - сколько не хватает.
    4.3. Если при подготовке произошла неизвестная ошибка.

    !!! Сообщения об ошибках выводите через NSLocalizedString !!!
 */



// MARK: - Solution 3B
// Ваше решение можете реализовать тут

var imposterOnBoard: Bool = true
var komandirOutOfBorard: Bool = false
var sturmanOutOfBorard: Bool = false
var lowAgeOfWorking: Bool = true
var whoLowWorked: String


enum RocketCrewError: Error {
    case astronausts
    case noKomandirOnBoard
    case noShurmanOnBoars
    case insufficientAstronauts(needed: Int)
    case isImposterOnBoard
    case lowTimeWorked
}

enum Role: Equatable {
    case komandir
    case shturman
    case mehanik
    case medic
    case ingeneer
    case cooker
    case stuard
    case imposter
    
    
}


struct MemberOnBoard {
    var name: String
    var role: Role
    var age: Int
    var worked: Int
    
}

let firstAustronaut = MemberOnBoard(name: "Makar", role: .komandir, age: 33, worked: 12)
let secondAustronaut = MemberOnBoard(name: "Igor", role: .ingeneer, age: 35, worked: 15)
let thirtAustronaut = MemberOnBoard(name: "Roman", role: .cooker, age: 29, worked: 7)
let fourthAustronaut = MemberOnBoard(name: "Hanna", role: .medic, age: 26, worked: 2)
let fifthAustronaut = MemberOnBoard(name: "Olga", role: .shturman, age: 39, worked: 16)
let sixAustronaut = MemberOnBoard(name: "Vasilisa", role: .mehanik, age: 25, worked: 5)
let sevenAustronaut = MemberOnBoard(name: "Nastya", role: .stuard, age: 21, worked: 4)
let eigthAustronaut = MemberOnBoard(name: "Vasya", role: .imposter, age: 45, worked: 8)

var crew = [firstAustronaut]
crew.append(sixAustronaut)
crew.append(eigthAustronaut)
crew.append(fifthAustronaut)
crew.append(sevenAustronaut)

crew.forEach {
    if $0.role == .imposter {
        imposterOnBoard = false
        print($0.name)
    }
}

crew.forEach {
    if $0.role == .komandir {
        komandirOutOfBorard = true
    }
}

crew.forEach {
    if $0.role == .shturman {
        sturmanOutOfBorard = true
    }
}

crew.forEach {
    if $0.worked < 3 {
        lowAgeOfWorking = false
        print($0.name)
    }
}

func startRocketIntoTheSpace() throws {
    guard crew.count > 4 else { throw RocketCrewError.insufficientAstronauts(needed: 5 - crew.count) }
    guard imposterOnBoard == true else { throw RocketCrewError.isImposterOnBoard }
    guard komandirOutOfBorard else { throw RocketCrewError.noKomandirOnBoard }
    guard sturmanOutOfBorard else { throw RocketCrewError.noShurmanOnBoars }
    guard lowAgeOfWorking else { throw RocketCrewError.lowTimeWorked }
    
    print("Ready! Steady! Go!")
}

do {
    try startRocketIntoTheSpace()
} catch RocketCrewError.insufficientAstronauts(let needed) {
    print("WE NEED MORE ASTRONAUTS: \(needed)")
} catch RocketCrewError.isImposterOnBoard {
    print("IS IMPOSTER! WE CAN'T START")
} catch RocketCrewError.noKomandirOnBoard {
    print("NO KOMANDIR ON BOARD!")
} catch RocketCrewError.noShurmanOnBoars {
    print("NO SHTURMAN ON BOARD!")
} catch RocketCrewError.lowTimeWorked {
    print("HAS LOW WORKED YEARS")
}

struct Passanger {
    var name: String
    var gender: String
    var age: Int
    var weight: Float
    
    init(name: String, gender: String, age: Int, weight: Float ) {
        self.name = name
        self.gender = gender
        self.age = age
        self.weight = weight
    }
}




// =================================
// MARK: - Task 4B
// =================================

/*
 Перепишите решение задачи 4 из классной работы для выполнения следующих условий:

 1. Username пользователя должен быть длиной не менее 8 символов и не длиннее 20ти. Верните соответствующее сообщение.

 2. Username должен содержать хотя бы одну Заглавную букву, хотя бы одну цифру и символ "-".
    Укажите пользователю, какой символ в имени не подходит.

 3. Username не может состоять только из цифр. Верните соответствующее сообщение.

 4. Username не может состоять только из Заглавных букв. Верните соответствующее сообщение.

 5. Символы, кроме "-", запрещены! Верните соответствующее сообщение.

 6. Username не может начинаться с символа "-" или цифры. Верните соответствующее сообщение.

 7. Username не может заканчиваться на символ "-". Верните соответствующее сообщение.

 Для каждой конкретной ситуации реазуйте возврат ошибки, в понятном и очевидном виде для пользователя.
 Воспользуйтесь `NSLocalizedString`

 */



// MARK: - Solution 4B
// Ваше решение можете реализовать тут
// ...

