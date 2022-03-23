//
//  CirularSubMenuView.m
//  XYK
//
//  Created by Hjc on 2022/3/11.
//

#import "CirularSubMenuView.h"
#import "CircularSubLayout.h"
#import "CirularSubMenuCell.h"
@interface CirularSubMenuView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>
/** 内容*/
@property(nonatomic,weak) UIView *contentView;
@end

@implementation CirularSubMenuView
{
    UICollectionView *menuSubCollectionView;

}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //背景
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0;
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        //内容
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0,kwt(238),kwt(238))];
        contentView.backgroundColor = RGBColor(255, 255, 255, 0.4);
        contentView.layer.cornerRadius = kwt(238)/2;
//        contentView.alpha = 0.4;
        self.contentView = contentView;
        
        [[UIApplication sharedApplication].keyWindow addSubview:contentView];
        
        CircularSubLayout *layout = [[CircularSubLayout alloc]init];
        //设置竖直滚动放向(默认是竖直方向)
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
        menuSubCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        menuSubCollectionView.backgroundColor = [UIColor clearColor];
        //添加到视图
        [contentView addSubview:menuSubCollectionView];
        menuSubCollectionView.scrollsToTop = NO;
        //开启分页
        menuSubCollectionView.pagingEnabled = NO;
        //不显示滚动条
        menuSubCollectionView.showsHorizontalScrollIndicator = NO;
        //弹簧效果设置
        menuSubCollectionView.bounces = NO;
        //设置代理
        menuSubCollectionView.dataSource = self;
        menuSubCollectionView.delegate = self;
        //注册cell
        [menuSubCollectionView registerClass:[CirularSubMenuCell class] forCellWithReuseIdentifier:@"CirularSubMenuCellID"];
        
        [menuSubCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kht(0));
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismiss];
}

- (void)setRect:(CGRect)rect{
    _rect = rect;
    
    CGFloat x = self.rect.origin.x;
    CGFloat y = self.rect.origin.y;
    //计算点击的一级菜单模块在屏幕中 中点的位置
    CGFloat tmpx = self.rect.size.width/2;
    
    self.contentView.HJC_centers_x = x+tmpx;
    self.contentView.HJC_centers_y = y+tmpx;
    
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
    return self.itmeAry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CirularSubMenuCell *cell = (CirularSubMenuCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CirularSubMenuCellID" forIndexPath:indexPath];
    cell.title = self.itmeAry[indexPath.row];
    return cell;
    
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    CATransform3D  transform;
//    transform.m34 = 1.0/-800;
//    //定义 Cell的初始化状态
//    cell.layer.transform = transform;
//    //定义Cell 最终状态 并且提交动画
//    [UIView beginAnimations:@"transform" context:NULL];
//    [UIView setAnimationDuration:1];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
//    [UIView commitAnimations];
//}
//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.itmeAry[indexPath.row];
    if (!kisEmptyString(title)) {
        if (self.block) {
            [self dismiss];
            self.block(self.itmeAry[indexPath.row]);
        }
    }
}

#pragma mark - 显示界面
- (void)showShareVote
{
    [UIView animateWithDuration:0.25 animations:^{
    
        self.alpha = 0.6;

        [self->menuSubCollectionView reloadData];
    }];
}

#pragma mark - 隐藏界面
- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
//        self.contentView.HJC_y = SCREEN_HEIGHT;
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
    } completion:^(BOOL finished) {

    }];
}

@end
