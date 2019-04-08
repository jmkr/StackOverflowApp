//
//  UserModel.h
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : JSONModel
@property (nonatomic) NSString *display_name;
@property (nonatomic) NSInteger reputation;
@property (nonatomic) NSString *profile_image;
@property (nonatomic) NSMutableDictionary *badge_counts;
@end

NS_ASSUME_NONNULL_END
