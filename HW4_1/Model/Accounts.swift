//
//  Accounts.swift
//  HW4_1
//
//  Created by Nikita Zharinov on 07/02/2021.
//


struct Account {
    var loginName: String
    let password: String
    let person: Person
}

struct Person {
    let personName: String
    let personSurname: String
    let personImage: String
    let work: Company
    let hobby: [Hobby]
}

struct Company {
    let companyName: String
    let jobTitle: String
    let contactDetail: String
}

struct Hobby {
    let hobbyDescription: String
    let hobbyImage: String
}

func getAccount() -> Account{
    let newAccount = Account(loginName: "User",
                          password: "Password",
                          person: Person(personName: "Nikita",
                                         personSurname: "Zharinov",
                                         personImage: "3.png",
                                         work: Company(companyName: "IBM",
                                                       jobTitle: "Employee",
                                                       contactDetail: "info@ibm.ru"),
                                         hobby: [
                                            Hobby(hobbyDescription: "Лучше гор могут быть только горы", hobbyImage: "1.png"),
                                            Hobby(hobbyDescription: "Гитара - это для души", hobbyImage: "2.png")
                                         ])
    )
    return newAccount
}
