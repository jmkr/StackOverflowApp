//
//  AddUserTableViewCell.h
//  StackOverflowApp
//
//  Created by John Meeker on 4/8/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AddUserCellType) {
    AddUserCellTypeDisplayName,
    AddUserCellTypeReputation,
    AddUserCellTypeGold,
    AddUserCellTypeSilver,
    AddUserCellTypeBronze,
    AddUserCellCount
};

@protocol AddUserTableViewCellDelegate <NSObject>
- (void)textFieldHasEnteredText:(NSString *_Nullable)text forType:(AddUserCellType)type;
@end

NS_ASSUME_NONNULL_BEGIN

@interface AddUserTableViewCell : UITableViewCell
@property (nonatomic) enum AddUserCellType type;
@property (nonatomic, weak) id<AddUserTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
