//
//  CircularMenu.h
//  XYK
//
//  Created by Hjc on 2022/3/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CircularMenuDelegate <NSObject>
- (void)clickMenuItemOfindex:(NSInteger)row withRect:(CGRect)rect;
@end

@interface CircularMenu : UIView
/**标题数组*/
@property(nonatomic, strong) NSArray *titleAry;
/**图片数组*/
@property(nonatomic, strong) NSArray *itemImgAry;
/** 代理 */
@property(nonatomic, assign) id<CircularMenuDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
