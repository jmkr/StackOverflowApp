//
//  UserModel.m
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.badge_counts = [NSMutableDictionary new];
    }
    return self;
}

@end
