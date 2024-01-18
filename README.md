# CustomCurrencyTextField

[![CI Status](https://img.shields.io/travis/hajc1294/CustomCurrencyTextField.svg?style=flat)](https://travis-ci.org/hajc1294/CustomCurrencyTextField)
[![Version](https://img.shields.io/cocoapods/v/CustomCurrencyTextField.svg?style=flat)](https://cocoapods.org/pods/CustomCurrencyTextField)
[![License](https://img.shields.io/cocoapods/l/CustomCurrencyTextField.svg?style=flat)](https://cocoapods.org/pods/CustomCurrencyTextField)
[![Platform](https://img.shields.io/cocoapods/p/CustomCurrencyTextField.svg?style=flat)](https://cocoapods.org/pods/CustomCurrencyTextField)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CustomCurrencyTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CustomCurrencyTextField'
```

You can clone this repository and run the example, if you have some issues with ReactiveObjC just change its deployment target in the Pod configuration to iOS 12.0, this
solve the SDK error.

## Usage

Import CustomCurrencyTextField or change your UITextField class in yor Storyboard to CustomCurrencyTextField.

You can set some CustomCurrencyTextField's properties in yor Storyboard, 

- Symbol (String): currency symbol ($ by default).
- Comma for decimals (BOOL): character separator, if YES uses (.) as integer separator and (,) as decimal separator. If NO uses (,) as integer separator and (,) as decimal separator.
- Integers (Int): integer part length, 7 by default.
- Decimals (Int): number of decimals, 0 by default.

## Author

hajc1294, hajc1294@gmail.com

## License

CustomCurrencyTextField is available under the MIT license. See the LICENSE file for more info.
