//
//  AddUserViewController.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "AddUserViewController.h"
#import "AddUserTableViewCell.h"
#import "UserModel.h"

static NSString* const reuseId = @"ADD_USER_CELL_REUSE_ID";

@interface AddUserViewController () <AddUserTableViewCellDelegate>
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic) UserModel *user;
@end

@implementation AddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [UserModel new];
}

/**
 @brief Handles press to the Add User button; passes new user through our delegate and pops current controller.
 @param sender The Add User button
 */
- (IBAction)addUserButtonPressed:(id)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(userCreated:)]) {
        [self.delegate userCreated:self.user];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AddUserTableViewCell *cell = (AddUserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    cell.type = indexPath.row;
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return AddUserCellCount;
}

# pragma mark - AddUserTableViewCellDelegate
/**
 @brief The delegate method called by the table view cell. Sets info for new User.
 @param text The text entered in the text field
 @param type The type of cell calling this method
 */
- (void)textFieldHasEnteredText:(NSString * _Nullable)text forType:(AddUserCellType)type {
    switch (type) {
        case AddUserCellTypeDisplayName:
            self.user.display_name = text;
            break;
        case AddUserCellTypeReputation:
            self.user.reputation = [text intValue];
            break;
        case AddUserCellTypeGold:
            [self.user.badge_counts setValue:[NSNumber numberWithInt:[text intValue]] forKey:@"gold"];
            break;
        case AddUserCellTypeSilver:
            [self.user.badge_counts setValue:[NSNumber numberWithInt:[text intValue]] forKey:@"silver"];
            break;
        case AddUserCellTypeBronze:
            [self.user.badge_counts setValue:[NSNumber numberWithInt:[text intValue]] forKey:@"bronze"];
            break;
        default:
            break;
    }
}

@end
