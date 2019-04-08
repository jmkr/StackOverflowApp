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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setType:(enum AddUserCellType)type {
    _type = type;
    switch (type) {
        case AddUserCellTypeDisplayName:
            self.textField.placeholder = @"Display Name";
            break;
        case AddUserCellTypeReputation:
            self.textField.placeholder = @"Reputation";
            break;
        case AddUserCellTypeGold:
            self.textField.placeholder = @"Gold Badge Count";
            break;
        case AddUserCellTypeSilver:
            self.textField.placeholder = @"Silver Badge Count";
            break;
        case AddUserCellTypeBronze:
            self.textField.placeholder = @"Bronze Badge Count";
            break;
        default:
            self.textField.placeholder = @"";
            break;
    }
}


# pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(textFieldHasEnteredText:forType:)]) {
        [self.delegate textFieldHasEnteredText:textField.text forType:self.type];
    }
    return YES;
}

@end
