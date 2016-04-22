//
// plog.swift
// Created by Jeffrey Leung on 31/03/2016.
//
//
// The MIT License (MIT)
//
// Copyright (c) 2016 Jeffrey Leung.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

struct plog {
    static let ESCAPE = "\u{001b}["
    
    static let RESET_FG = ESCAPE + "fg;" // Clear any foreground color
    static let RESET_BG = ESCAPE + "bg;" // Clear any background color
    static let RESET = ESCAPE + ";"   // Clear any foreground or background color
    
    // Colors
    
    static private func customColor<T>(red red: Int, green: Int, blue: Int, object: T) -> String {
        
        return "\(ESCAPE)fg\(red),\(green),\(blue);\(object)\(RESET)"
    }
    
    static private func red<T>(object: T) -> String {
        
        return customColor(red: 255, green: 0, blue: 0, object: object)
    }
    
    static private func green<T>(object: T) -> String {
        
        return customColor(red: 0, green: 255, blue: 0, object: object)
    }
    
    static private func blue<T>(object: T) -> String {
        
        return customColor(red: 0, green: 0, blue: 255, object: object)
    }
    
    static private func cyan<T>(object: T) -> String {
        
        return customColor(red: 0, green: 255, blue: 255, object: object)
    }
    
    static private func magenta<T>(object: T) -> String {
        
        return customColor(red: 255, green: 0, blue: 255, object: object)
    }
    
    static private func yellow<T>(object: T) -> String {
        
        return customColor(red: 255, green: 255, blue: 0, object: object)
    }
    
    static private func orange<T>(object: T) -> String {
        
        return customColor(red: 255, green: 140, blue: 0, object: object)
    }
    
    static private func purple<T>(object: T) -> String {
        
        return customColor(red: 178, green: 102, blue: 255, object: object)
    }
    
    static private func pink<T>(object: T) -> String {
        
        return customColor(red: 255, green: 51, blue: 153, object: object)
    }
    
    static private func brown<T>(object: T) -> String {
        
        return customColor(red: 165, green: 42, blue: 42, object: object)
    }
    
    static private func white<T>(object: T) -> String {
        
        return customColor(red: 255, green: 255, blue: 255, object: object)
    }
    
    static private func black<T>(object: T) -> String {
        
        return customColor(red: 0, green: 0, blue: 0, object: object)
    }
    
    static private func grey<T>(object: T) -> String {
        
        return customColor(red: 128, green: 128, blue: 128, object: object)
    }
    
    static private func lightGrey<T>(object: T) -> String {
        
        return customColor(red: 230, green: 230, blue: 230, object: object)
    }
    
    // Log functions
    
    #if DEBUG
    
    // Message
    static func m(message: String = "", absoluteFileName: String = #file, function: String = #function, lineNumber: Int = #line) {
        
        let fileName = absoluteFileName.lastPathComponent
        
        print(customColor(red: 0, green: 255, blue: 128, object: "💬 \(fileName): ") +
                purple("\(function) ") +
                pink("\(lineNumber): ") +
                lightGrey("\(message)"))
    }
    
    // Type Any
    static func a<T>(any: T, absoluteFileName: String = #file, function: String = #function, lineNumber: Int = #line) {
        
        let fileName = absoluteFileName.lastPathComponent
        
        print(customColor(red: 0, green: 255, blue: 128, object: "🌟 \(fileName): ") +
            purple("\(function) ") +
            pink("\(lineNumber): ") +
            lightGrey("\(any)"))
    }
    
    // Type NSError
    static func e(error: NSError, absoluteFileName: String = #file, function: String = #function, lineNumber: Int = #line) {
        
        let fileName = absoluteFileName.lastPathComponent
        
        print(red("❗️ \(fileName): \(function) \(lineNumber): \(error.domain), \(error.description)"))
    }
    
    #else
    
    static func m(message: String = "", absoluteFileName: String = #file, function: String = #function, lineNumber: Int = #line) { }
    
    static func a<T>(object: T, absoluteFileName: String = #file, function: String = #function, lineNumber: Int = #line) { }
    
    static func e(error: NSError, absoluteFileName: String = #file, function: String = #function, lineNumber: Int = #line) { }
    
    #endif
}

extension String {
    
    var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent
        }
    }
}
