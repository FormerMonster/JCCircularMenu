//
//  CirularSubMenuCell.m
//  XYK
//
//  Created by Hjc on 2022/3/11.
//

#import "CirularSubMenuCell.h"

@implementation CirularSubMenuCell
{
    
    UILabel *cellLabel;
    UIView *bg;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        bg = [[UIView alloc] init];
        bg.layer.cornerRadius = kwt(25);
        [self.contentView addSubview:bg];
        
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(0);
            make.size.mas_equalTo(kwt(50));
        }];
        
        cellLabel = [[UILabel alloc] init];
        cellLabel.textColor = UIColor.blackColor;
        cellLabel.font = [UIFont systemFontOfSize:12];
        cellLabel.backgroundColor = UIColor.whiteColor;
        cellLabel.numberOfLines = 2;
        cellLabel.textAlignment = NSTextAlignmentCenter;
        [bg addSubview:cellLabel];
        
        [cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(kwt(35));
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    
    cellLabel.text = title;
    
    if (kisEmptyString(title)) {
        bg.backgroundColor = UIColor.clearColor;
    }else{
        bg.backgroundColor = UIColor.whiteColor;
    }
}
@end
