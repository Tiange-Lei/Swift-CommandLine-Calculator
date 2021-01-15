//
//  main.swift
//  calc
//  Created by Tiange Lei on 6/12/20.
//  Copyright © 2020 UTS. All rights reserved.


import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
var data=args.joined(separator: " ") //transform the args into a String separated by " "
var data2=data.replacingOccurrences(of: "- ", with: "+ -") //Substitude the "-" operator with "+ -" operator, for instance: 3 - 5 -> 3 + -5
var data3=data2.replacingOccurrences(of: "--", with: "") //Deal with the "--" operator from the substitution above, for instance: 3 - -5 -> 3 + --5 -> 3 + 5
//After that, the user input string can be separated by "+", the result can be easier to calculate by adding the value of each component.For instance: 3 x 5 + 4 / 2 - 6 % 5 ----> (3 x 5) + (4 / 2) + -(6 % 5)


//Execution:
//Uncaught error Version:
    var validInput = try checkInvalidInput(data3)
    var result=transformInput(validInput)  //After the validation of user input, tranform the input into associative array
    getResult(result) //Add up to get the final result and print it out
//Safe Version:
//do {
//    let validInput = try checkInvalidInput(data3)
//    var result=transformInput(validInput)
//    getResult(result)
//
//}catch is CalculateError{
//    print("Calculate Error")
//}catch{
//    print("Unknown issue found")
//}


