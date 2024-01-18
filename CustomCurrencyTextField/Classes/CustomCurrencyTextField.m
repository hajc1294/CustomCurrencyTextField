//
//  CustomCurrencyTextField.m
//  CustomCurrencyTextField
//
//  Created by Jean Carlo Hernández Arguedas on 17/1/24.
//

#import "CustomCurrencyTextField.h"

@interface CustomCurrencyTextField()

@property (copy, nonatomic) NSString *integerSeparator;
@property (copy, nonatomic) NSString *decimalSeparator;
@property (copy, nonatomic) NSString *plainValue;

@end

@implementation CustomCurrencyTextField

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        self.delegate = self;
        self.plainValue = @"";
        [self setSymbol: @"$"];
        [self setCommaForDecimals: NO];
        [self setIntegers: 7];
        [self setMaxDecimals: 0];
        [self addTarget: self action: @selector(textFieldDidChange:) forControlEvents: UIControlEventEditingChanged];
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    
    if (!self.symbol) {
        [self setSymbol: @"$"];
    }
    
    if (!self.commaForDecimals) {
        [self setCommaForDecimals: NO];
    }
    
    if (!self.integers) {
        [self setIntegers: 7];
    }
    
    if (!self.decimals) {
        [self setDecimals: 0];
    }
    
    self.keyboardType = UIKeyboardTypeDecimalPad;
    self.text = [self currencyValue: [NSNumber numberWithDouble: 0 / pow(10, _decimals)]];
}

#pragma mark - Getters

- (NSString *) plainNumber {
    if (self.text.length > 2) {
        NSString *noCurrencySign = [self.text substringFromIndex: 2];
        return [noCurrencySign stringByReplacingOccurrencesOfString: _integerSeparator withString: @""];
    }
    return @"";
}

- (NSString *) integerPart {
    return [[[self plainNumber] componentsSeparatedByString: _decimalSeparator] objectAtIndex: 0];
}

- (NSString *) decimalPart {
    if (_decimals > 0) {
        NSString *decimals = [[self.text componentsSeparatedByString: _decimalSeparator] objectAtIndex: 1];
        if ([decimals intValue] == 0) {
            return @"";
        }
        return decimals;
    }
    return @"";
}

- (NSString *) getStringValue {
    return self.text;
}

- (NSNumber *) getNumberValue {
    NSString *numberDecimalSeparator = @".";
    NSString *plainNumber = [self plainNumber];
    if (![_decimalSeparator isEqual: numberDecimalSeparator]) {
        plainNumber = [plainNumber stringByReplacingOccurrencesOfString: _decimalSeparator withString: numberDecimalSeparator];
    }
    return [NSNumber numberWithDouble: [plainNumber doubleValue]];
}

- (BOOL) isZero {
    return [[self getNumberValue] isEqual: @(0)];
}

#pragma mark - Setters

- (void) setSymbol: (NSString *) symbol {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\p{Sc}"];
    if ([predicate evaluateWithObject: symbol]) {
        _symbol = symbol;
    } else {
        _symbol = @"$";
    }
}

- (void) setCommaForDecimals: (BOOL) commaForDecimals {
    _commaForDecimals = commaForDecimals;
    if (_commaForDecimals) {
        _integerSeparator = @".";
        _decimalSeparator = @",";
    } else {
        _integerSeparator = @",";
        _decimalSeparator = @".";
    }
}

- (void) setIntegers: (NSInteger) integers {
    _integers = integers < 1 ? 1 : MIN(integers, 10);
}

- (void) setMaxDecimals: (NSInteger) decimals {
    _decimals = decimals < 0 ? 0 : MIN(decimals, 4);
}

#pragma mark - Delegates

- (void) textFieldDidChange: (UITextField *) textField {
    textField.text = [self currencyFormatter];
}

- (BOOL) textField: (UITextField *) textField shouldChangeCharactersInRange: (NSRange) range replacementString: (NSString *) string {
    NSCharacterSet *charset = [[NSCharacterSet characterSetWithCharactersInString: @"0123456789"] invertedSet];
    NSString *filter = [[string componentsSeparatedByCharactersInSet: charset] componentsJoinedByString: @""];
    
    if (string.length == 0 && [_plainValue length] > 0) {
        _plainValue = [_plainValue substringToIndex:[_plainValue length] - 1];
        return YES;
    }
    
    if ([string isEqualToString: filter] && (_plainValue.length < (_integers + _decimals))) {
        _plainValue = [NSString stringWithFormat: @"%@%@", _plainValue, string];
        return YES;
    }
    return NO;
}

#pragma mark - Formatters

- (NSString *) currencyValue: (NSNumber *) value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier: @"en_US"];
    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
    [formatter setLocale: [NSLocale currentLocale]];
    [formatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [formatter setMinimumIntegerDigits: 1];
    [formatter setMaximumIntegerDigits: _integers];
    [formatter setMinimumFractionDigits: _decimals];
    [formatter setMaximumFractionDigits: _decimals];
    [formatter setGroupingSeparator: _integerSeparator];
    [formatter setDecimalSeparator: _decimalSeparator];
    return [NSString stringWithFormat: @"%@ %@", _symbol, [formatter stringFromNumber: value]];
}

- (NSString *) currencyFormatter {
    double number = [_plainValue doubleValue] / [self decimalExtension];
    return [self currencyValue: [NSNumber numberWithDouble: number]];
}

- (NSInteger) decimalExtension {
    if (_decimals > 0) {
        return pow(10, _decimals);
    }
    return 1;
}

@end
