# COCOAPODS

# What
CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 91 thousand libraries and is used in over 3 million apps. CocoaPods can help you scale your projects elegantly.

# Why
- Manage dependency

# How to use cocoapods to install a dependency in your project

1. Install COCOAPODS on your device

`$ sudo gem install cocoapods`


2. Search for pods https://cocoapods.org/ . Then list the dependencies in a text file named Podfile in your Xcode project directory:

```
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
  pod 'AFNetworking', '~> 2.6'
  pod 'ORStackView', '~> 3.0'
  pod 'SwiftyJSON', '~> 2.3'
end
```

Tip: CocoaPods provides a pod init command to create a Podfile with smart defaults. You should use it.

Add pod from local machine:

`pod 'Name', :path => '~/code/Pods/'`

Add pod from git:

`pod 'NAME', :git => 'https://example.com/URL/to/repo/NAME.git'`




3. Now you can install the dependencies in your project:

`$ pod install`

4. Make sure to always open the Xcode workspace instead of the project file when building your project:

`$ open App.xcworkspace`

5. Now you can import your dependencies e.g.:

`#import <Reachability/Reachability.h>`

# Create a pod Using Pod Lib Create

https://guides.cocoapods.org/making/using-pod-lib-create

1. Run
```
pod lib create MyLibrary
```
2. Add your code to MyLibrary/Classes
 - a Swift library needs to have its classes declared as public for you to see them in your project using the library.
3. Add your pod to Podfile of your app project

4. Run `pod install`

5. Import your lib when you want to use it

```
import MyLibrary
```

6. Use your lib