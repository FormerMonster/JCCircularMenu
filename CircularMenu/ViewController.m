//
//  ViewController.m
//  CircularMenu
//
//  Created by Hjc on 2022/3/23.
//

#import "ViewController.h"
#import "CircularMenu.h"
#import "CirularSubMenuView.h"
@interface ViewController ()<CircularMenuDelegate>
/**圆形布局*/
@property(nonatomic, strong) CircularMenu *circularView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;

    self.circularView.itemImgAry = @[@"yinling",@"chengzhang",@"guanhuai",@"guanli",@"jianshe",@"minzhu"];
    self.circularView.titleAry = @[@"先进引领",@"个人成长",@"生活关怀",@"组织管理",@"思想建设",@"民主管理"];
}

//圆形菜单一级菜单
- (void)clickMenuItemOfindex:(NSInteger)row withRect:(CGRect)rect{
    
#warning 二级菜单数组个数要统一
    //数组必须8个
    NSArray *ary = @[];
    if (row ==0) {
        ary = @[@"",@"教师风采2",@"教师风采3",@"教师风采4",@"教师风采5",@"教师风采6",@"教师风采7",@"教师风采8"];
    }
    if (row ==1) {
        ary = @[@"个人中心1",@"个人中心2",@"个人中心3",@"个人中心4",@"个人中心5",@"个人中心6",@"个人中心7",@"个人中心8"];
    }
    if (row ==2) {
        ary = @[@"百宝箱1",@"百宝箱2",@"百宝箱3",@"百宝箱4",@"百宝箱5",@"百宝箱6",@"百宝箱7",@"百宝箱8"];
    }
    if (row ==3) {
        ary = @[@"工作通知1",@"工作通知2",@"工作通知3",@"工作通知3",@"",@"",@"",@""];
    }
    if (row ==4) {
        ary = @[@"",@"",@"",@"",@"",@"公会之声",@"政策法规",@"知识竞赛"];
    }
    if (row ==5) {
        ary = @[@"",@"",@"",@"",@"节日关怀",@"问卷调查",@"投票",@"信用评价"];
    }
    
    //展示二级圆形菜单
    CirularSubMenuView *sunMenuView = [[CirularSubMenuView alloc] init];
    sunMenuView.itmeAry = ary;
    sunMenuView.rect = rect;
    [sunMenuView showShareVote];
    
    sunMenuView.block = ^(NSString * _Nonnull title) {
        
        NSLog(@"%@",title);
    };
   
}

- (CircularMenu *)circularView{

    if (!_circularView) {
        _circularView = [[CircularMenu alloc] initWithFrame:CGRectMake(0, kht(368), kwt(343), kht(390))];
        _circularView.HJC_centers_x = SCREEN_WIDTH/2;
        _circularView.delegate = self;
        
        [self.view addSubview:_circularView];
        
        [_circularView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(kht(-54));
            make.size.mas_equalTo(CGSizeMake(kwt(343), kht(390)));
            make.centerX.mas_equalTo(0);
        }];
    }
    return _circularView;
}

@end
