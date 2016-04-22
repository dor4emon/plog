# plog

plog, which stands for "pretty log", is a logging tool for Swift that allows you to visualize color in Xcode's debug console. You can print different values, including file name, function name and line number, in different colors. Although the default log functions are relatively fluid and simple, you may customize them to the finest level of granularity as you wish and add your own log functions as well.

## Installation

You need to install the [XcodeColors plug-in] (https://github.com/robbiehanson/XcodeColors#xcodecolors-installation-instructions-for-xcode-4-5-6--7) first.

The log functions are only enabled when running in `Debug` configuration. Make sure you have set a `-DDEBUG` flag in **Build Settings -> Swift Compiler - Custom Flags** as described [here] (http://stackoverflow.com/questions/24111854/in-absence-of-preprocessor-macros-is-there-a-way-to-define-practical-scheme-spe#).

Then add [plog.swift] (https://github.com/dor4emon/plog/blob/master/plog.swift) anywhere in your project and the log functions will be available.

## Usage

To log a message to the console:
```swift
plog.m("message")
```

where the argument is provided as a `String`.

You do not have to provide a message if you wish:
```swift
plog.m()
```

which will just print the file name, function name and line number of where this statement is.

To log a variable of type Any:
```swift
plog.a(someAny)
```

where `someAny` can be any variable of type Any.

To log an `NSError` to the console:
```swift
plog.e(error)
```

where `error` is an instance of `NSError`. This will provide you with the `error.domain` and `error.description` by default.

## Customization

Each log function is fully customizable to display whatever information you like. By default, all log functions print out the file name, function name and line number, followed by the log message, if specified. You may add additional components if you wish. For example, you might want to add the date and time at which the log message was recorded. 

Using `plog.m(_:)` as an example:

```swift
print(green("💬 \(NSDate()) ") +
        orange("\(fileName.lastPathComponent): ") +
        purple("\(function) ") +
        pink("\(lineNumber): ") +
        lightGrey("\(message)"))
```

If you do not want to log a certain component, simply remove it. 

Also, each log component is displayed in a different color for clarity. You may customize these colors to anything you want, using either the preset colors defined or by specifying your own RGB color. 

```swift
print(green("💬 \(fileName.lastPathComponent): ") +
        yellow("\(function) ") +
        pink("\(lineNumber): ") +
        lightGrey("\(message)"))
```

To use a custom RGB color for a component, use the `customColor(red:green:blue:object)` function:

```swift
print(customColor(red: 0, green: 255, blue: 128, object: "💬 \(fileName.lastPathComponent): ") +
        purple("\(function) ") +
        pink("\(lineNumber): ") +
        lightGrey("\(message)"))
```
