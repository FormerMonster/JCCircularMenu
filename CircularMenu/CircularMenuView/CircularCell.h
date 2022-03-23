//
//  CircularCell.h
//  XYK
//
//  Created by Hjc on 2022/3/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircularCell : UICollectionViewCell
/** itme图标 */
@property(nonatomic, copy) NSString *itemImgStr;
/** item名字 */
@property(nonatomic, copy) NSString *itemNameStr;
@end

NS_ASSUME_NONNULL_END
