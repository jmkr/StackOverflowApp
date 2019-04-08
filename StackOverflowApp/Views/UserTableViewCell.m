//
//  UserTableViewCell.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/7/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "UserTableViewCell.h"
#import "SDWebImage-umbrella.h"

@interface UserTableViewCell ()
@property (nonatomic,weak) IBOutlet UIImageView *profileImage;
@property (nonatomic,weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *reputationLabel;
@property (nonatomic,weak) IBOutlet UILabel *goldLabel;
@property (nonatomic,weak) IBOutlet UILabel *silverLabel;
@property (nonatomic,weak) IBOutlet UILabel *bronzeLabel;
@end

@implementation UserTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.profileImage sd_cancelCurrentImageLoad];
    self.profileImage.image = nil;
}

- (void)setUser:(NSDictionary *)user {
    if ([user valueForKey:@"display_name"] != nil) {
        [self.userNameLabel setText:[user valueForKey:@"display_name"]];
    }
    if ([user valueForKey:@"reputation"] != nil) {
        [self.reputationLabel setText:[[user valueForKey:@"reputation"] stringValue]];
    }
    if ([user objectForKey:@"badge_counts"] != nil) {
        if ([user[@"badge_counts"] valueForKey:@"gold"] != nil) {
            [self.goldLabel setText:[[user[@"badge_counts"] valueForKey:@"gold"] stringValue]];
        }
        if ([user[@"badge_counts"] valueForKey:@"silver"] != nil) {
            [self.silverLabel setText:[[user[@"badge_counts"] valueForKey:@"silver"] stringValue]];
        }
        if ([user[@"badge_counts"] valueForKey:@"bronze"] != nil) {
            [self.bronzeLabel setText:[[user[@"badge_counts"] valueForKey:@"bronze"] stringValue]];
        }
    }
    if ([user valueForKey:@"profile_image"] != nil) {
        [self.profileImage sd_setImageWithURL:[NSURL URLWithString:[user valueForKey:@"profile_image"]]];
    }
}

@end
