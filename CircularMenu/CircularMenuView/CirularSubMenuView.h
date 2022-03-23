//
//  CirularSubMenuView.h
//  XYK
//
//  Created by Hjc on 2022/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^cirularSubMenuBlock)(NSString *title);

@interface CirularSubMenuView : UIView

/**<#注释#>*/
@property(nonatomic, assign) CGRect rect;
/** 可变数组 */
@property(nonatomic, strong) NSArray *itmeAry;

/** 回调 */
@property(nonatomic, copy) cirularSubMenuBlock block;

- (void)showShareVote;
@end

NS_ASSUME_NONNULL_END
