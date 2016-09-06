//
//  BYSlideViewController.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/26.
//  Copyright © 2016年 zpx. All rights reserved.
//
#define kTopSlideFont 15
#define kMargin 10
#import "BYSlideViewController.h"
#import "TopSlideCollectionViewCell.h"
@interface BYSlideViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UICollectionView *topScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *buttomScrollView;
@property (nonatomic,strong)NSMutableArray *widths;
@property (nonatomic,strong)NSMutableArray *titles;
@property (nonatomic,assign)NSInteger selectedIndex;
@property (nonatomic,strong)UIView *maskView;
@end

@implementation BYSlideViewController
static NSString *const topSliderCellId = @"TopSlideCollectionViewCell";
static NSString *const buttomSliderCellId = @"ButtomSliderCell";
#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
    [self registerCellId];
    //添加子VC
    [self addChildVC];
    [self queryData];
    self.selectedIndex = 0;
}

#pragma mark - Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.childViewControllers.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == _topScrollView) {
        TopSlideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topSliderCellId forIndexPath:indexPath];
        cell.title.text = self.titles[indexPath.row];
        return cell;
    }else {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:buttomSliderCellId forIndexPath:indexPath];
        UIViewController *VC = self.childViewControllers[indexPath.row];
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        VC.view.frame = CGRectMake(0, 0, self.buttomScrollView.frame.size.width, self.buttomScrollView.frame.size.height);
        [cell.contentView addSubview:VC.view];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == _topScrollView) {
        NSString *title = self.titles[indexPath.row];
        CGRect titleBounds = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:fontSystem(kTopSlideFont)} context:nil];
        [self.widths addObject:@(titleBounds.size.width + 2*kMargin)];
        return CGSizeMake(titleBounds.size.width + 20, 40);
    }else {
        CGSize size = CGSizeMake(APP_W, self.buttomScrollView.frame.size.height );
        return size;
    }
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == _topScrollView) {
        self.selectedIndex = indexPath.row;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView  {

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _buttomScrollView) {
        CGFloat offsetX = scrollView.contentOffset.x;
//        NSInteger offsetXInt = offsetX;
//        NSInteger screenWInt = APP_W;
//        
//        NSInteger extre = offsetXInt % screenWInt;
//        if (extre > APP_W * 0.5) {
//            // 往右边移动
//            offsetX = offsetX + (APP_W - extre);
//            //            _isAniming = YES;
//            [scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
//        }else if (extre < APP_W * 0.5 && extre > 0){
//            //            _isAniming = YES;
//            // 往左边移动
//            offsetX =  offsetX - extre;
//            [scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
//        }
//        
        // 获取角标
        NSInteger i = offsetX / APP_W;
        self.selectedIndex = i;
    }
    
}

#pragma mark - Private Method
-(void)queryData {
//    [HTTPCLIENT post:@"Living/GetAD" params:nil success:^(id resultObj) {
//        BYLog(@"%@",resultObj);
//    } failure:^(NSError *error) {
//        BYLog(@"%@",error);
//    }];
}

-(void)registerCellId {
    [_topScrollView registerNib:[UINib nibWithNibName:topSliderCellId bundle:nil] forCellWithReuseIdentifier:topSliderCellId];
    [_buttomScrollView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:buttomSliderCellId];
}

-(void)addChildVC {
    UIViewController *v1 = [[UIViewController alloc]init];
    v1.title = @"喜马拉雅";
    v1.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:v1];
    UIViewController *v2 = [[UIViewController alloc]init];
    v2.title = @"体育";
    v2.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:v2];
    UIViewController *v3 = [[UIViewController alloc]init];
    v3.title = @"娱乐新闻头条";
    v3.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:v3];
    UIViewController *v4 = [[UIViewController alloc]init];
    v4.title = @"腾讯";
    v4.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:v4];
    UIViewController *v5 = [[UIViewController alloc]init];
    v5.title = @"今日头条";
    v5.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:v5];
    UIViewController *v6 = [[UIViewController alloc]init];
    v6.title = @"喜马拉雅";
    v6.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:v6];
    UIViewController *v7 = [[UIViewController alloc]init];
    v7.title = @"体育";
    v7.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:v7];
    UIViewController *v8 = [[UIViewController alloc]init];
    v8.title = @"娱乐新闻头条";
    v8.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:v8];
    UIViewController *v9 = [[UIViewController alloc]init];
    v9.title = @"腾讯";
    v9.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:v9];
    UIViewController *v10 = [[UIViewController alloc]init];
    v10.title = @"今日头条";
    v10.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:v10];
    [_topScrollView reloadData];
    [_buttomScrollView reloadData];
}
#pragma mark - Setter Getter
-(NSMutableArray *)titles {
    if (!_titles) {
        NSArray *arr = [self.childViewControllers valueForKey:@"title"];
        _titles = arr.mutableCopy;
    }
    return _titles;
}

-(NSMutableArray *)widths {
    if (!_widths) {
        _widths = @[].mutableCopy;
    }
    return _widths;
}

-(UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]initWithFrame:CGRectZero];
        _maskView.backgroundColor = [UIColor redColor];
        _maskView.layer.cornerRadius = 10;
        _maskView.alpha = 0.2;
        [_topScrollView insertSubview:_maskView atIndex:0];
    }
    return _maskView;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    [_topScrollView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    [_buttomScrollView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    CGFloat positionX = 0;
    for (NSInteger idx = 0; idx < selectedIndex; idx ++) {
        positionX += [self.widths[idx] floatValue];
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.maskView.frame = CGRectMake(positionX, 5, [self.widths[indexPath.row] floatValue],30);
    }];
}
@end
