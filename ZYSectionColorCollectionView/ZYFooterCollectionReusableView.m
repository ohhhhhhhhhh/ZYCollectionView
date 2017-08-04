//
//  ZYFooterCollectionReusableView.m
//  ZYSectionColorCollectionView
//
//  Created by zy on 2017/8/4.
//  Copyright © 2017年 zy. All rights reserved.
//

#import "ZYFooterCollectionReusableView.h"

@interface ZYFooterCollectionReusableView()

@property (nonatomic, weak) UIButton * btn;

@end

@implementation ZYFooterCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.btn.hidden = NO;
    }
    return self;
}


+ (NSString *)getIdentifier{
    return NSStringFromClass(self);
}

#pragma mark -make ui
-(UIButton *)btn{
    
    if (!_btn) {
        
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, self.frame.size.width-40, 44)];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        [self addSubview:btn];
        _btn = btn;
    }
    return _btn;
}

@end
