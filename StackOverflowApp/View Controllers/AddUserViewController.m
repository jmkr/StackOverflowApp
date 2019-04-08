//
//  AddUserViewController.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "AddUserViewController.h"
#import "AddUserTableViewCell.h"

static NSString* const reuseId = @"ADD_USER_CELL_REUSE_ID";

@interface AddUserViewController () <AddUserTableViewCellDelegate>
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@end

@implementation AddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addUserButtonPressed:(id)sender {
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

- (void)textFieldHasEnteredText:(NSString * _Nullable)text forType:(AddUserCellType)type {
    NSLog(@"Text: %@ forType: %ld", text, (long)type);
    switch (type) {
        case AddUserCellTypeDisplayName:

            break;
        case AddUserCellTypeReputation:

            break;
        case AddUserCellTypeGold:

            break;
        case AddUserCellTypeSilver:

            break;
        case AddUserCellTypeBronze:

            break;
        default:

            break;
    }
}

@end
