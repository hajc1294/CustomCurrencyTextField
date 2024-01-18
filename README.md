# CustomCurrencyTextField

Helps to use single Text Field with currency format.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

You can set some CustomCurrencyTextField's properties in yor Storyboard. You can do it from the **User Defined Runtime Attributes** or from the **Designalbes** attributes.

- **Symbol:** currency symbol (`$` by default).
- **Comma for decimals:** character separator, if `YES` uses `"."` as integer separator and `","` as decimal separator. If `NO` uses `","` as integer separator and `"."` as decimal separator.
- **Integers:** integer part length, `7` by default.
- **Decimals:** number of decimals, `0` by default.

![Screenshot 2024-01-18 at 14 19 09](https://github.com/hajc1294/CustomCurrencyTextField/assets/61942641/2059ca37-b92e-4d1b-ae9c-5bc21a315111)

You can combine this pod with others like **ReactiveObjC** to listen to changes in the text field in real-time.

```Objective-C
#import "ReactiveObjC.h"

.
.
.

[[self.currencyTextField.rac_textSignal distinctUntilChanged] subscribeNext: ^(NSString * value) {
        ... Do something
}];
```
Finnaly, you have some functions that helps you to get some important data from the test field.

```Objective-C
- (NSString *) plainNumber;        // $ 123,123.01 => 123123.01
- (NSString *) integerPart;        // $ 123,123.01 => 123123
- (NSString *) decimalPart;        // $ 123,123.01 => 01
- (NSString *) getStringValue;     // $ 123,123.01
- (NSNumber *) getNumberValue;     // $ 123,123.01 => 123123.01
- (BOOL) isZero;                   // $ 123,123.01 => NO
```

## Demo

<img src="https://github.com/hajc1294/CustomCurrencyTextField/assets/61942641/59287955-e1e5-4171-8720-d21db621ac7a" width="250">   <img src="https://github.com/hajc1294/CustomCurrencyTextField/assets/61942641/93e9269b-2fe3-480b-8328-7939cdf9c1ad" width="250">

## Author

hajc1294, hajc1294@gmail.com

## License

CustomCurrencyTextField is available under the MIT license. See the LICENSE file for more info.
