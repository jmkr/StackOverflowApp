//
//  UsersTableViewController.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/7/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "UsersTableViewController.h"
#import "UserTableViewCell.h"
#import "StackOverflowApp-Swift.h"

static NSString* const reuseId = @"USER_CELL_REUSE_ID";

@interface UsersTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) BOSResource *usersResource;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *users;
@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usersResource = [[StackExchangeAPI.instance resource:@"users"] withParam:@"site" value:@"stackoverflow"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchUsers];
}

- (void)fetchUsers {
    (void)[[self.usersResource requestWithMethod:@"GET"] onCompletion:^(BOSEntity *response, BOSError *error) {
        if (error != nil) {
            self.users = @[];
        } else if (response.content != nil && [response.content objectForKey:@"items"] != nil) {
            self.users = [response.content objectForKey:@"items"];
        }
    }];
}

-(void)setUsers:(NSArray *)users {
    _users = users;
    [self.tableView reloadData];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
