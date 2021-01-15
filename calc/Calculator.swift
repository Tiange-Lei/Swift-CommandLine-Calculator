//
//  Calculator.swift
//  calc
//
//  Created by Tiange Lei on 6/12/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation
 

//Enumeration:
//Different types of error
    enum CalculateError:Error{
        case InvalidInput
        case IncompleteInput
        case CantDivideByZero
    }

//Functions:

//Check the invalid input and throw the error before move on to the calculation 
func checkInvalidInput(_ input:String) throws ->String{
    let input2=input.components(separatedBy: " ")
    let rs=separatArray(input2)
    let numberArray=rs.numberArray
    let operatorArray=rs.operatorArray
    let length = input2.count
//According to the length of input array, check the value of input
    switch(length){
    //If there is no value or only 2 value, throw the error
    case 0,2:
        throw CalculateError.IncompleteInput
    //If there is only one value in input, check if it is a number
    case 1:
        let a = input2[0]
        if stringToIntCheck(a){
            return input
        }else{
            throw CalculateError.InvalidInput
        }
    //If the input has more than 3 values, check each value in numberArray and operatorArray, respectively
    case 3...:
        var array1=[Int]()
        var array2=[Int]()
        //Each value in numberArray should be integer
        for i in numberArray{
            stringToIntCheck(i) ? array1.append(1):array1.append(2)
        }
        //Each value in operatorArray should be + or - or x or / or %
        for j in operatorArray{
            isValidOperatorCheck(j) ? array2.append(1):array2.append(2)
        }
        if array1.contains(2){
            //If the number array has one value that is not a number, throw the error
            throw CalculateError.InvalidInput
        }else if array2.contains(2){
            //If the operator array has one value that is not a legal operator, throw the error
            throw CalculateError.InvalidInput
        }else if input.contains("/ 0"){
            //If a number is divided by zero, throw the error
            throw CalculateError.CantDivideByZero
        }else{
            return input
        }
    default:
        return input
    }
}
//Transform the input string into an array separated by " ", then divide this array into subarrays by "+", return an associative array.
func transformInput(_ input:String)->[[String]]{
        var finalArray=[[String]]()
        let array1=input.components(separatedBy: " ")
        let array2=array1.split(separator: "+")
        for i in array2{
            finalArray.append(Array(i))
        }
        return finalArray
}
//For the associative array, calculate each subarray first, then add them up to print the sum.
func getResult(_ input:[[String]]){
        var result=0
        for i in input{
            if stringToIntCheck(process(i)){
                let partOfResult = Int(process(i))!  //Using force unwrapping here because it has passed string to  integer check.
                result+=partOfResult
            }else{
                break
            }
        }
        print(result)
}
//Basic operation functions
func add(_ num1:Int,_ num2:Int)->Int{
    return num1+num2
}
func subtract(_ num1:Int,_ num2:Int)->Int{
    return num1-num2
}
func multiply(_ num1:Int,_ num2:Int)->Int{
    return num1*num2
}
func divide(_ num1:Int,_ num2:Int)->Int{
    return num1/num2
}
func modulus(_ num1:Int,_ num2:Int)->Int{
    return num1%num2
}
//Call each operation according to the user input in each case.
func calculate(_ num1:Int,_ op:String,_ num2:Int)->Int?{
    switch (op){
    case("+"):
        return add(num1,num2)
    case("-"):
        return subtract(num1,num2)
    case("x"):
        return multiply(num1,num2)
    case("/"):
        return divide(num1,num2)
    case("%"):
        return modulus(num1,num2)
    default:
        return nil
    }
}
//Execute a basic calculation function to deal with every first three values and return the final result.
func process(_ input:[String])->String{
    var input2=input //Create a copy of the argument, which can be modified.
    while input2.count>2{
        let no1=Int(input2[0])!
        let no2=Int(input2[2])!
        let op=input2[1]
        let rs=calculate(no1, op, no2)
        let rs2=String(rs!)    //Using force unwrapping here because the input value has go through the invalid input check
        input2[0...2]=[rs2]    //Replace the first three values with the calculated result
    }
    return input2[0]
}
//Separate the input array into numberArray and operatorArray according to the index.
func separatArray(_ input: [String])->(numberArray:[String],operatorArray:[String]){
    var nArray=[String]()
    var oArray=[String]()
    for i in input.indices where i%2==0{
            nArray.append(input[i])
    }
    for j in input.indices where j%2==1{
        oArray.append(input[j])
    }
    return (nArray,oArray)
}
//Used to check if a string type value can be transformed to a integer type value.
func stringToIntCheck(_ input:String)->Bool{
    if let _ = Int(input){
        return true
    }else{
        return false
    }
}
//Used to check if it is a valid operator according to the instruction
func isValidOperatorCheck(_ input:String)->Bool{
    switch input{
    case "+","-","x","/","%":
        return true
    default:
        return false
    }
}
