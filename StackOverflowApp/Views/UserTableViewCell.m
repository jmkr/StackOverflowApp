//
//  UserTableViewCell.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/7/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "UserTableViewCell.h"
#import "UserModel.h"
#import "SDWebImage-umbrella.h"

@interface UserTableViewCell ()
@property (nonatomic,weak) IBOutlet UIImageView *profileImage;
@property (nonatomic,weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *reputationLabel;
@property (nonatomic,weak) IBOutlet UILabel *goldLabel;
@property (nonatomic,weak) IBOutlet UILabel *silverLabel;
@property (nonatomic,weak) IBOutlet UILabel *bronzeLabel;
@property (nonatomic,strong) NSNumberFormatter *numberFormatter;
@end

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.numberFormatter = [NSNumberFormatter new];
    [self.numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.profileImage sd_cancelCurrentImageLoad];
    self.profileImage.image = nil;
    [self.userNameLabel setText:@""];
    [self.reputationLabel setText:@"0"];
    [self.goldLabel setText:@"0"];
    [self.silverLabel setText:@"0"];
    [self.bronzeLabel setText:@"0"];
}

/**
 @brief Sets User info for this cell
 @param user The user
 */
- (void)setUser:(UserModel *)user {
    if (user.display_name != nil) {
        [self.userNameLabel setText:user.display_name];
    }
    if (user.reputation != 0) {
        NSString *reputation =  [self.numberFormatter stringFromNumber:[NSNumber numberWithInteger:user.reputation]];
        [self.reputationLabel setText:reputation];
    }
    if (user.badge_counts != nil) {
        if ([user.badge_counts valueForKey:@"gold"] != 0) {
            [self.goldLabel setText:[NSString stringWithFormat:@"%i", [[user.badge_counts valueForKey:@"gold"] intValue]]];
        }
        if ([user.badge_counts valueForKey:@"silver"] != 0) {
            [self.silverLabel setText:[NSString stringWithFormat:@"%i", [[user.badge_counts valueForKey:@"silver"] intValue]]];
        }
        if ([user.badge_counts valueForKey:@"bronze"] != 0) {
            [self.bronzeLabel setText:[NSString stringWithFormat:@"%i", [[user.badge_counts valueForKey:@"bronze"] intValue]]];
        }
    }
    if (user.profile_image != nil) {
        [self.profileImage sd_setImageWithURL:[NSURL URLWithString:user.profile_image]];
    }
}

@end
