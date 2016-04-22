# plog

plog, which stands for "pretty log", is a logging tool for Swift that allows you to visualize color in Xcode's debug console. You can print different values, including file name, function name and line number, in different colors. Although the default log functions are relatively fluid and simple, you may customize them to the finest level of granularity as you wish and add your own log functions as well.

## Installation

You need to install the [XcodeColors plug-in] (https://github.com/robbiehanson/XcodeColors#xcodecolors-installation-instructions-for-xcode-4-5-6--7) first.

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

To log an NSError to the console:
```swift
plog.e(error)
```

where `error` is an instance of `NSError`. This will provide you with the `error.domain` and `error.description` by default.
