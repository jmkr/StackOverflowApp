//
//  UserTableViewCell.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/7/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "UserTableViewCell.h"

@interface UserTableViewCell ()

@property (nonatomic,weak) IBOutlet UIImageView *profileImage;
@property (nonatomic,weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *reputationLabel;
@property (nonatomic,weak) IBOutlet UILabel *goldLabel;
@property (nonatomic,weak) IBOutlet UILabel *silverLabel;
@property (nonatomic,weak) IBOutlet UILabel *bronzeLabel;

@end

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(NSDictionary *)user {
    if ([user valueForKey:@"display_name"] != nil) {
        [self.userNameLabel setText:[user valueForKey:@"display_name"]];
    }
}

@end
