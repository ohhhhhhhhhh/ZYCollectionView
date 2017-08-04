//
//  ViewController.m
//  ZYSectionColorCollectionView
//
//  Created by zy on 2017/8/4.
//  Copyright © 2017年 zy. All rights reserved.
//

#import "ViewController.h"
#import "ULBCollectionViewFlowLayout.h"
#import "ZYCollectionViewCell.h"
#import "ZYFooterCollectionReusableView.h"
#import "ZYHeaderCollectionReusableView.h"

@interface ViewController ()<ULBCollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,   weak) UICollectionView * collectV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.collectV.backgroundColor = [UIColor grayColor];
}

#pragma mark -make ui
-(UICollectionView *)collectV{
    
    if (!_collectV) {
        
        ULBCollectionViewFlowLayout * flowLayout = [[ULBCollectionViewFlowLayout alloc]init];
        UICollectionView * collection = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        collection.delegate   = self;
        collection.dataSource = self;
        [collection registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:[ZYCollectionViewCell getIdentifier]];
        [collection registerClass:[ZYFooterCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[ZYFooterCollectionReusableView getIdentifier]];
        [collection registerClass:[ZYHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[ZYHeaderCollectionReusableView getIdentifier]];
        [self.view addSubview:collection];
        _collectV = collection;
    }
    return _collectV;
}

#pragma mark -<UICollectionViewDelegate,UICollectionViewDataSource>
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ZYCollectionViewCell getIdentifier] forIndexPath:indexPath];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 2;
    }
    
    if (section == 1) {
        return 5;
    }
    return 3;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(100, 100);
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(self.view.frame.size.width, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    if (section == 2) {
        return CGSizeMake(self.view.frame.size.width, 100);
    }else{
        return CGSizeZero;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionReusableView * reusable = nil;
    
    
    if([kind isEqualToString:UICollectionElementKindSectionFooter] &&
       indexPath.section == 2){
        
        ZYFooterCollectionReusableView * footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[ZYFooterCollectionReusableView getIdentifier] forIndexPath:indexPath];
        footer.backgroundColor = [UIColor whiteColor];
        reusable = footer;
    }else{
        
        ZYHeaderCollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[ZYHeaderCollectionReusableView getIdentifier] forIndexPath:indexPath];
        reusable = header;
    }
    return reusable;
}

#pragma mark -<ULBCollectionViewDelegateFlowLayout>
-(UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout colorForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return [UIColor purpleColor];
    }
    
    if (section == 1) {
        return [UIColor redColor];
    }
    
    return [UIColor yellowColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
