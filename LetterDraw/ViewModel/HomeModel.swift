//
//  HomeViewModel.swift
//  LetterDraw
//
//  Created by Ihor on 30.08.2022.
//

import Foundation

class HomeModel: ObservableObject {
    @Published var letterOrNumberSwitch: Bool = true
    
    @Published var letters: [String] = ["А","Б","В","Г","Ґ","Д","Е","Є","Ж","З","И","і","ї","Й","К","Л","М","Н","О","П","Р","С","Т","У","Ф","Х","Ц","Ч","Ш","Щ","ь","Ю","Я"]
    
    @Published var numbers: [String] = ["1","2","3","4","5","6","7","8","9","0"]
    
    @Published var letterIndx: Int = 0
    @Published var numberIndx: Int = 0
    
    @Published var lines: [Line] = []
    
    func nextLetterOrNumber() {
        if letterOrNumberSwitch {
            if letterIndx != 32 {
                letterIndx += 1
                lines = []
            } else if letterIndx == 32 {
                letterIndx = 0
                lines = []
            }
        } else {
            if numberIndx != 9 {
                numberIndx += 1
                lines = []
            } else if numberIndx == 9 {
                numberIndx = 0
                lines = []
            }
        }
    }
    
    func prevLetterOrNumber() {
        if letterOrNumberSwitch {
            if letterIndx != 0 {
                letterIndx -= 1
                lines = []
            }
        } else {
            if numberIndx != 0 {
                numberIndx -= 1
                lines = []
            }
        }
    }
    
    func change() {
        letterOrNumberSwitch.toggle()
        if letterOrNumberSwitch {
            letterIndx = 0
            lines = []
        } else {
            numberIndx = 0
            lines = []
        }
    }
}
