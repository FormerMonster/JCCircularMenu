//
//  CircularSubLayout.m
//  XYK
//
//  Created by Hjc on 2022/3/11.
//

#import "CircularSubLayout.h"

@implementation CircularSubLayout
{
    NSMutableArray *attary;
}

- (void)prepareLayout{
    
    self.itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    attary = [[NSMutableArray alloc] init];
    
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height)/2;
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    
    for (int i = 0; i<self.itemCount; i++) {
        UICollectionViewLayoutAttributes *attibutes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        attibutes.size = CGSizeMake(kwt(84), kwt(84));
        
        //计算每个item的中点坐标  获取到item的中点减去自身的半径才是item的中点
        CGFloat x = center.x +cosf(2*M_PI/self.itemCount*i)*(radius-kwt(42));
        CGFloat y = center.y +sinf(2*M_PI/self.itemCount*i)*(radius-kwt(42));
        
        attibutes.center = CGPointMake(x, y);
        [attary addObject:attibutes];
    }
}

- (CGSize)collectionViewContentSize{
    
    return self.collectionView.frame.size;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    return attary;
}
@end
