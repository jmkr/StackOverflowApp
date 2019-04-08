//
//  AddUserTableViewCell.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "AddUserTableViewCell.h"

@interface AddUserTableViewCell () <UITextFieldDelegate>
@property (nonatomic,weak) IBOutlet UITextField *textField;
@end

@implementation AddUserTableViewCell

- (void)setType:(enum AddUserCellType)type {
    _type = type;
    switch (type) {
        case AddUserCellTypeDisplayName:
            self.textField.placeholder = @"Display Name";
            self.textField.keyboardType = UIKeyboardTypeDefault;
            break;
        case AddUserCellTypeReputation:
            self.textField.placeholder = @"Reputation";
            self.textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case AddUserCellTypeGold:
            self.textField.placeholder = @"Gold Badge Count";
            self.textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case AddUserCellTypeSilver:
            self.textField.placeholder = @"Silver Badge Count";
            self.textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case AddUserCellTypeBronze:
            self.textField.placeholder = @"Bronze Badge Count";
            self.textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        default:
            self.textField.placeholder = @"";
            self.textField.keyboardType = UIKeyboardTypeDefault;
            break;
    }
}


# pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(textFieldHasEnteredText:forType:)]) {
        [self.delegate textFieldHasEnteredText:textField.text forType:self.type];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(textFieldHasEnteredText:forType:)]) {
        [self.delegate textFieldHasEnteredText:textField.text forType:self.type];
    }
    [textField resignFirstResponder];
    return YES;
}

@end
