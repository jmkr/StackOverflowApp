//
//  AddUserViewController.h
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@protocol AddUserViewControllerDelegate <NSObject>
- (void)userCreated:(UserModel *_Nullable)user;
@end

NS_ASSUME_NONNULL_BEGIN

@interface AddUserViewController : UIViewController
@property (nonatomic, weak) id<AddUserViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
