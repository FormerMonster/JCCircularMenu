//
//  CircularMenu.m
//  XYK
//
//  Created by Hjc on 2022/3/1.
//

#import "CircularMenu.h"
#import "CircularLayout.h"
#import "CircularCell.h"

@interface CircularMenu ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CircularMenu
{
    UICollectionView *menucollectionView;

}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:242/255.0 green:212/255.0 blue:177/255.0 alpha:0.8];
        self.layer.cornerRadius = kht(8);
        //创建一个流水布局
        CircularLayout *layout = [[CircularLayout alloc]init];
        //设置竖直滚动放向(默认是竖直方向)
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
        menucollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        menucollectionView.backgroundColor = [UIColor clearColor];
        //添加到视图
        [self addSubview:menucollectionView];
        menucollectionView.scrollsToTop = NO;
        //开启分页
        menucollectionView.pagingEnabled = NO;
        //不显示滚动条
        menucollectionView.showsHorizontalScrollIndicator = NO;
        //弹簧效果设置
        menucollectionView.bounces = NO;
        //设置代理
        menucollectionView.dataSource = self;
        menucollectionView.delegate = self;
        //注册cell
        [menucollectionView registerClass:[CircularCell class] forCellWithReuseIdentifier:@"CircularCellID"];
        
        [menucollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kht(0));
            make.height.mas_equalTo(kht(295));
            make.right.mas_equalTo(kwt(-15));
            make.left.mas_equalTo(kwt(15));
        }];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = UIColor.whiteColor;
        line.alpha = 0.4;
        [self addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(kht(-94));
            make.size.mas_equalTo(CGSizeMake(kwt(272), kht(1)));
        }];

    }
    return self;
}



#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleAry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CircularCell *cell = (CircularCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CircularCellID" forIndexPath:indexPath];
    cell.itemImgStr = self.itemImgAry[indexPath.row];
    cell.itemNameStr = self.titleAry[indexPath.row];
    return cell;
    
}
//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CircularCell *cell = (CircularCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    CGRect cellRect = [menucollectionView convertRect:cell.frame toView:menucollectionView];
    
    CGRect rect2 = [menucollectionView convertRect:cellRect toView:self.superview];

    if (_delegate && [_delegate respondsToSelector:@selector(clickMenuItemOfindex:withRect:)]) {
        [_delegate clickMenuItemOfindex:indexPath.row withRect:rect2];
    }
}


- (void)setItemImgAry:(NSArray *)itemImgAry{
    _itemImgAry = itemImgAry;
}

- (void)setTitleAry:(NSArray *)titleAry{
    _titleAry = titleAry;
    
    [menucollectionView reloadData];
}


@end
