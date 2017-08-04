//
//  ZYCollectionViewCell.m
//  ZYSectionColorCollectionView
//
//  Created by zy on 2017/8/4.
//  Copyright © 2017年 zy. All rights reserved.
//

#import "ZYCollectionViewCell.h"

@implementation ZYCollectionViewCell

+ (NSString *)getIdentifier{
    return NSStringFromClass(self);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
