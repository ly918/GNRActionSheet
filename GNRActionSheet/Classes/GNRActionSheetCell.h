//
//  GNRActionSheetCell.h
//  FBSnapshotTestCase
//
//  Created by Luca on 2018/4/3.
//

#import <UIKit/UIKit.h>

@interface GNRActionSheetCell : UITableViewCell

@property (nonatomic, assign)BOOL isCancel;
@property (nonatomic, strong)NSString *title;

@end
