//
//  UsersTableViewController.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/7/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "UsersTableViewController.h"
#import "UserTableViewCell.h"
#import "AddUserViewController.h"
#import "StackOverflowApp-Swift.h"

static NSString* const reuseId = @"USER_CELL_REUSE_ID";

@interface UsersTableViewController () <UITableViewDelegate, UITableViewDataSource, AddUserViewControllerDelegate>
@property (nonatomic, strong) BOSResource *usersResource;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *users;
@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usersResource = [[StackExchangeAPI.instance resource:@"users"] withParam:@"site" value:@"stackoverflow"];
    [self fetchUsers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

/**
 @brief Fetches users from the StackOverflow API and parses them into array of UserModels.
 */
- (void)fetchUsers {
    (void)[[self.usersResource requestWithMethod:@"GET"] onCompletion:^(BOSEntity *response, BOSError *error) {
        if (error != nil) {
            self.users = @[];
        } else if (response.content != nil && [response.content objectForKey:@"items"] != nil) {
            NSMutableArray *newUsers = [NSMutableArray new];
            for (NSDictionary *userJson in [response.content objectForKey:@"items"]) {
                [newUsers addObject:[[UserModel alloc] initWithDictionary:userJson error:NULL]];
            }
            self.users = newUsers;
        }
    }];
}

/**
 @brief Sets the users array and reloads the table view.
 @param users The array of users
 */
-(void)setUsers:(NSArray *)users {
    _users = users;
    [self.tableView reloadData];
}

/**
 @brief Overrides the prepareForSegue method and sets the AddUserViewControllerDelegate to self.
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:NSStringFromClass([AddUserViewController class])]) {
        AddUserViewController *vc = [segue destinationViewController];
        vc.delegate = self;
    }
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UserTableViewCell *cell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    [cell setUser:[_users objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _users.count;
}

#pragma mark - AddUserViewControllerDelegate
/**
 @brief Handles the userCreated method being called from AddUserViewController, adds new user to tableview.
 @param user The new user we have created
 */
- (void)userCreated:(UserModel *)user {
    NSMutableArray *users = [self.users mutableCopy];
    [users addObject:user];
    self.users = users;
}

@end
