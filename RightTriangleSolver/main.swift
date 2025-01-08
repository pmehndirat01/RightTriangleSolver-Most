//
//  main.swift
//  RightTriangleSolver
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 admin. All rights reserved.

import Foundation

// initialize the measurements
// variables for the angles

var calcAngleA : Double = 0.0
var calcAngleB : Double = 0.0
var calcAngleC : Double = 0.0

// variables for the sides

var calcSideA : Double = 0.0
var calcSideB : Double = 0.0
var calcSideC : Double = 0.0

// side and angle counters

var numOfSides : Int = 0
var numOfAngles : Int = 0

// Boolean variables to use for the CONTROL FLOW

var isRightTriangle : Bool = false
var isThreeSides : Bool = false
var isTwoSides : Bool = false
var isOneSide : Bool = false
var isTriangle : Bool = false
var isSolved : Bool = false

// Setup a constant for pi

let pi = 3.14159

// Tolerence
// Tolerence lets us continue with the code if and when there are slight differences between numbers.

let tolerence : Double = 0.001

// Is side or is angle

var MentA : String
var MentB : String
var MentC : String

print("Welcome to the right triangle solver!")

// Get the sides from the user

print("Please enter three measurements from your triangle below. If you don't hava a value, input 0.")
print("Side1, (a)")

// Prompting for all of the sides and angles

calcSideA = Double(readLine()!)!
if(calcSideA != 0){
    numOfSides += 1
}
print("Side2, (b)")
calcSideB = Double(readLine()!)!
if(calcSideB != 0){
    numOfSides += 1
}
print("Side3, (c)")
calcSideC = Double(readLine()!)!
if(calcSideC != 0){
    numOfSides += 1
}

// Determining whether it is 3 sides or 3 angles

if(numOfSides == 3){
    print("0 Angles and 3 Sides Inputted")
    isThreeSides = true
}else if(numOfSides == 0){
    print("You cannot input 3 Angles! Please restart and try again.")
} else {
    if(numOfSides + numOfAngles < 3){
        print("Angle1, (A)")
        calcAngleA = Double(readLine()!)!
        if(calcAngleA != 0){
            numOfAngles += 1
        }
        if(calcAngleA > 90 || calcAngleA < 0){
            print("An Angle must be between 0 and 90. Please try again.")
            numOfAngles += 10
        }
    }
    if(numOfSides + numOfAngles < 3){
        print("Angle2, (B)")
        calcAngleB = Double(readLine()!)!
        if(calcAngleB != 0){
            numOfAngles += 1
        }
        if(calcAngleB > 90 || calcAngleB < 0){
            print("An Angle cannot be more than 90 degrees or less than zero. Please try again.")
            numOfAngles += 10
        }
        if(numOfAngles + numOfSides == 1){
            numOfAngles += 10
            print("Wrong Number of inputs. Please try again.")
        }
    }
    if(numOfSides + numOfAngles < 3){
        print("Angle3, (C)")
        calcAngleC = Double(readLine()!)!
        if(calcAngleC != 0){
            numOfAngles += 1
        }
        if(calcAngleC > 90 || calcAngleC < 0){
            print("An Angle cannot be more than 90 degrees or less than zero. Please try again.")
            numOfAngles += 10
        }
    }
}

// Determining if it is 2 sides or 1 side

if(numOfSides + numOfAngles < 3){
    print("Wrong Number of Inputs. please restart and try again.")
}else if(numOfSides == 1 && numOfAngles == 2){
    print("2 Angles and 1 Side Inputted")
    isOneSide = true
}else if(numOfSides == 2 && numOfAngles == 1){
    print("1 Angle and 2 Sides Inputted")
    isTwoSides = true
}
if (calcAngleA + calcAngleB + calcAngleC >= 180){
    print("Three Angles cannot equal more than 180. Please try again.")
}

// Sorting routine

var AngleSwapPlaceholder : Double = 0.0
var SideSwapPlaceholder : Double = 0.0
if(isThreeSides){
    // If Side A is the greatest side
    if(calcSideA > calcSideC) && (calcSideA > calcSideB){
        // Swap Side A and C plus their corresponding angles because side C should be the longest.
        SideSwapPlaceholder = calcSideA
        calcSideA = calcSideC
        calcSideC = SideSwapPlaceholder
        AngleSwapPlaceholder = calcAngleA
        calcAngleA = calcAngleC
        calcAngleC = AngleSwapPlaceholder
    }else if(calcSideB > calcSideC){
        // Swap Side b and c plus their corresponding angles because side c should be the longest.
        SideSwapPlaceholder = calcSideB
        calcSideB = calcSideC
        calcSideC = SideSwapPlaceholder
        AngleSwapPlaceholder = calcAngleB
        calcAngleB = calcAngleC
        calcAngleC = AngleSwapPlaceholder
    }
// Checking that angle C is always 90
}else if(isOneSide || isTwoSides){
    if(calcAngleC == 90){
        print("Good Job")
    }else if(calcAngleB == 90){
        // switch sideB with sideC along with their corresponding angles
        AngleSwapPlaceholder = calcAngleB
        calcAngleB = calcAngleC
        calcAngleC = AngleSwapPlaceholder
        SideSwapPlaceholder = calcSideB
        calcSideB = calcSideC
        calcSideC = SideSwapPlaceholder
    }else if(calcAngleA == 90){
        // switch sideA with sideC along with their corresponding angles
        AngleSwapPlaceholder = calcAngleA
        calcAngleA = calcAngleC
        calcAngleC = AngleSwapPlaceholder
        SideSwapPlaceholder = calcSideA
        calcSideA = calcSideC
        calcSideC = SideSwapPlaceholder
    }else if(calcAngleC != 0 && calcAngleC != 90){
        //if C has something other than 90 in it
        if(calcAngleB == 0){
            // Swap Angle B and C if A is 0.
            AngleSwapPlaceholder = calcAngleB
            calcAngleB = calcAngleC
            calcAngleC = AngleSwapPlaceholder
            SideSwapPlaceholder = calcSideB
            calcSideB = calcSideC
            calcSideC = SideSwapPlaceholder
        }else if(calcAngleA == 0){
            // Swap Angle A and C if A is 0.
            AngleSwapPlaceholder = calcAngleA
            calcAngleA = calcAngleC
            calcAngleC = AngleSwapPlaceholder
            SideSwapPlaceholder = calcSideA
            calcSideA = calcSideC
            calcSideC = SideSwapPlaceholder
        }
    }
}


// Triangle check

if(isThreeSides) {
    if(calcSideA  + calcSideB > calcSideC){
        print("Your measurements make a triangle")
        isTriangle = true
    }else if(calcSideA  + calcSideB <= calcSideC){
        print("Your measurements do not create a triangle")
        isTriangle = false
    }
} else if (isTwoSides) {
    if(calcAngleA + calcAngleB + calcAngleC <= 180){
        print("Your measurements create a triangle")
        isTriangle = true
    }else{
        print("Your measurements do not create a triangle")
        isTriangle = false
    }
} else if (isOneSide) {
        if(calcAngleA + calcAngleB + calcAngleC <= 180){
            print("Your measurements create a triangle")
            isTriangle = true
        } else{
            print("Your measurements do not create a triangle")
            isTriangle = false
        }
    }

// Right Triangle Check

if(isTriangle){
    if(isThreeSides){
        if(calcSideA * calcSideA + calcSideB * calcSideB == calcSideC * calcSideC){
            print("Your measurements create a right triangle.")
            isRightTriangle = true
        }else{
            isRightTriangle = false
            print("Your measurements do not create a right triangle.")
        }
    } else if(isTwoSides){
        if calcAngleC == 90{
            if((calcSideC > calcSideA && calcSideC > calcSideB) || calcSideC == 0) {
                isRightTriangle = true
                print("Your measurements create a right triangle.")
            }else{
                isRightTriangle = false
                print("Your measurements do not create a right triangle.")
            }
        }else if(calcAngleA > 0){
            // AngleA, Twosides
            
            if (calcSideC == 0){
                if (tolerence > abs(tan(calcAngleA * pi / 180) - (calcSideA / calcSideB))){
                    isRightTriangle = true
                    print("Your measurements create a right triangle.")
                }else{
                    isRightTriangle = false
                    print("Your measurements do not create a right triangle.")
                }
            }else if(calcSideB == 0){
                if (tolerence > abs(sin(calcAngleA * pi / 180) - (calcSideA / calcSideC))){
                    isRightTriangle = true
                    print("Your measurements create a right triangle.")
                }else{
                    isRightTriangle = false
                    print("Your measurements do not create a right triangle.")
                }
            }else if(calcSideA == 0){
                if (tolerence > abs(cos(calcAngleA * pi / 180) - (calcSideB / calcSideC))){
                    isRightTriangle = true
                    print("Your measurements create a right triangle.")
                }else{
                    isRightTriangle = false
                    print("Your measurements do not create a right triangle.")
                }
            }
        } else if(calcAngleB > 0){
            // AngleB, Twosides

            if (calcSideC == 0){
                if (tolerence > abs(tan(calcAngleB * pi / 180) - (calcSideB / calcSideA))){
                    isRightTriangle = true
                    print("Your measurements create a right triangle.")
                }else{
                    isRightTriangle = false
                    print("Your measurements do not create a right triangle.")
                }
            }else if(calcSideB == 0){
                if (tolerence > abs(cos(calcAngleB * pi / 180) - (calcSideA / calcSideC))){
                    isRightTriangle = true
                    print("Your measurements create a right triangle.")
                }else{
                    isRightTriangle = false
                    print("Your measurements do not create a right triangle.")
                }
            }else if(calcSideA == 0){
                if (tolerence > abs(sin(calcAngleB * pi / 180) - (calcSideB / calcSideC))){
                    isRightTriangle = true
                    print("Your measurements create a right triangle.")
                }else{
                    isRightTriangle = false
                    print("Your measurements do not create a right triangle.")
                }
            }
        }
    }else if(isOneSide){
        if (calcAngleA + calcAngleB == 90 || calcAngleC == 90){
            isRightTriangle = true
            print("Your measurements create a right triangle.")
        }else{
            isRightTriangle = false
            print("Your measurements do not create a right triangle.")
        }
    }
}

// Solve

if(isRightTriangle){
    calcAngleC = 90
    if (isOneSide){
        // OneSide
        // FindMissingAngle
        if(calcAngleA == 0){
            calcAngleA = 90 - calcAngleB
            print("A =", calcAngleA)
        }else if(calcAngleB == 0){
            calcAngleB = 90 - calcAngleA
            print("B =", calcAngleB)
        }else if(calcAngleC == 0){
            calcAngleC = 90
        }

        // FindMissingSides
        if(calcSideC > 0){
            calcSideB = calcSideC * (sin(calcAngleB * pi / 180))
            calcSideA = calcSideB * (tan(calcAngleA * pi / 180))
        } else if(calcSideB > 0){
            calcSideA = calcSideB * (tan(calcAngleA * pi / 180))
            calcSideC = calcSideA / (cos(calcAngleB * pi / 180))
        } else if(calcSideA > 0){
            calcSideB = calcSideA / (tan(calcAngleA * pi / 180))
            calcSideC = sqrt(calcSideA * calcSideA + calcSideB * calcSideB)
        }
        isSolved = true
    }
    if (isTwoSides){
        calcAngleC = 90
        // TwoSides
        // Find the missing side
        if(calcSideA == 0){
            calcSideA = sqrt((calcSideC * calcSideC) - (calcSideB * calcSideB))
            print("A =", calcSideA)
        }else if(calcSideB == 0){
            calcSideB = sqrt((calcSideC * calcSideC) - (calcSideA * calcSideA))
            print("B =", calcSideB)
        }else if(calcSideC == 0){
            calcSideC = sqrt((calcSideA * calcSideA) + (calcSideB * calcSideB))
            print("C =", calcSideC)
        }
        isThreeSides = true
    }

    if(isThreeSides){
        // ThreeSides
        // Finding all three angles
        calcAngleC = 90
        calcAngleA = asin(calcSideA/calcSideC) * 180 / pi
        calcAngleB = 90 - calcAngleA
        print("A =", calcAngleA, "B =", calcAngleB, "C =", calcAngleC )
        isSolved = true
    }
}

//Display
if(isSolved){
    print("Your measurements have sucessfully made it through our right traingle solver.")
    print("Your triangle has the following measurements:")
    print("A(angle) =", calcAngleA)
    print("B(angle) =", calcAngleB)
    print("C(angle) =", calcAngleC)
    print("A(side) =", calcSideA)
    print("B(side) =", calcSideB)
    print("C(side) =", calcSideC)
}

//right data type to the compiler.
//Determine what type of measurements that you have been given. ie two sides and 1 angle, 3 sides, 2 angles and 1 sid
//Note that 3 angles is a failure case, you cannot determine the dimensions of a triangle with 3 angles
//Order the sides and angles (make sure that the largest angle is angle C
//Determine if the measurements form a triangle
//Determine if the measurements form a right triangle
//Determine the remaining measurements based on information provided
//    print("Your triangle has the following measurements:")
  //  print("a = \(calcSideA) b = \(calcSideB) c = \(calcSideC)")
    //print("A = \(calcAngleA * 180 / pi) B = \(calcAngleB * 180 / pi) C = \(calcAngleC * 180 / pi)")
//3, 4, 5 solutions
/*
 A(angle) = 36.86992878854058
 B(angle) = 53.13007121145942
 C(angle) = 90.0
 A(side) = 3.0
 B(side) = 4.0
 C(side) = 5.0
 
 A(angle) = 28.0725106476883
 B(angle) = 61.927489352311696
 C(angle) = 90.0
 A(side) = 8.0
 B(side) = 15.0
 C(side) = 17.0
 
 A(angle) = 22.61988405423912
 B(angle) = 67.38011594576088
 C(angle) = 90.0
 A(side) = 5.0
 B(side) = 12.0
 C(side) = 13.0
*/
