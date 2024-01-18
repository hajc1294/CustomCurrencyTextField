//
//  CTFTableViewController.m
//  CustomCurrencyTextField
//
//  Created by hajc1294 on 01/17/2024.
//  Copyright (c) 2024 hajc1294. All rights reserved.
//

#import "CTFTableViewController.h"
#import "CustomCurrencyTextField.h"
#import "ReactiveObjC.h"

@interface CTFTableViewController ()

@property (weak, nonatomic) IBOutlet CustomCurrencyTextField *currencyTextField;
@property (weak, nonatomic) IBOutlet UILabel *reactiveXLabel;
@property (weak, nonatomic) IBOutlet UILabel *itsZeroLabel;
@property (weak, nonatomic) IBOutlet UILabel *integersLabel;
@property (weak, nonatomic) IBOutlet UILabel *decimalsLabel;
@property (weak, nonatomic) IBOutlet UILabel *plainNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *stringValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberValueLabel;

@end

@implementation CTFTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self subscribeSignals];
    [self loadCurrencyTextFieldData];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) subscribeSignals {
    [[self.currencyTextField.rac_textSignal distinctUntilChanged] subscribeNext: ^(NSString * value) {
        self.reactiveXLabel.text = [NSString stringWithFormat: @"%@ %@", @"ReactiveX listening:", value];
    }];
}

- (void) loadCurrencyTextFieldData {
    self.itsZeroLabel.text = [NSString stringWithFormat: @"%@ %id", @"It's zero:", [self.currencyTextField isZero]];
    self.integersLabel.text = [NSString stringWithFormat: @"%@ %@", @"Integer part:", [self.currencyTextField integerPart]];
    self.decimalsLabel.text = [NSString stringWithFormat: @"%@ %@", @"Decimal part:", [self.currencyTextField decimalPart]];
    self.plainNumberLabel.text = [NSString stringWithFormat: @"%@ %@", @"Plain number:", [self.currencyTextField plainNumber]];
    self.stringValueLabel.text = [NSString stringWithFormat: @"%@ %@", @"String value:", [self.currencyTextField getStringValue]];
    self.numberValueLabel.text = [NSString stringWithFormat: @"%@ %@", @"Number value:", [self.currencyTextField getNumberValue]];
}

- (IBAction) getInfoAction: (id) sender {
    [self loadCurrencyTextFieldData];
}

@end

