//
//  CustomCurrencyTextField.h
//  Pods
//
//  Created by Jean Carlo Hernández Arguedas on 17/1/24.
//

IB_DESIGNABLE
@interface CustomCurrencyTextField : UITextField<UITextFieldDelegate>

@property (copy, nonatomic) IBInspectable NSString *symbol;
@property (nonatomic) IBInspectable BOOL commaForDecimals;
@property (nonatomic) IBInspectable NSInteger integers;
@property (nonatomic) IBInspectable NSInteger decimals;

- (NSString *) plainNumber;
- (NSString *) integerPart;
- (NSString *) decimalPart;
- (NSString *) getStringValue;
- (NSNumber *) getNumberValue;
- (BOOL) isZero;

@end
