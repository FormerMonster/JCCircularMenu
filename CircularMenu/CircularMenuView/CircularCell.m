//
//  CircularCell.m
//  XYK
//
//  Created by Hjc on 2022/3/1.
//

#import "CircularCell.h"

@implementation CircularCell
{
    UIImageView *cellImg;
    UILabel *cellLabel;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.cornerRadius = kwt(42);
        self.layer.masksToBounds = YES;
        
        UIImageView *bgimg = [[UIImageView alloc] initWithImage:UIImageMake(@"cellbg")];
        bgimg.userInteractionEnabled = YES;
        [self.contentView addSubview:bgimg];
        [bgimg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.size.mas_equalTo(kwt(84));
        }];
        
        
        cellImg = [[UIImageView alloc] init];
        
        [self.contentView addSubview:cellImg];
        
        [cellImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kht(18));
            make.size.mas_equalTo(kwt(28));
            make.centerX.mas_equalTo(0);
        }];
        
        
        cellLabel = [[UILabel alloc] init];
        cellLabel.textColor = My16Color(0xECCCCD);
        cellLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:cellLabel];
        
        [cellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(cellImg.mas_bottom).offset(kht(6));
        }];
    }
    return self;
}

- (void)setItemImgStr:(NSString *)itemImgStr{
    _itemImgStr = itemImgStr;
    cellImg.image = UIImageMake(itemImgStr);
}

- (void)setItemNameStr:(NSString *)itemNameStr{
    _itemNameStr = itemNameStr;
    
    cellLabel.text = itemNameStr;
}


@end
