//
//  FilterManager.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "FilterManager.h"
@interface FilterManager()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *mainDataSource;
@property (nonatomic,strong)NSMutableArray *subDataSource;
@end
@implementation FilterManager
+(FilterManager *)createFilterManagerWith:(NSArray *)dataSource {
    FilterManager *manager = [[NSBundle mainBundle]loadNibNamed:@"FilterManager" owner:nil options:nil][0];
    manager.mainDataSource = dataSource.mutableCopy;
    return manager;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    _mainDataSource = [NSMutableArray array];
    _subDataSource = [NSMutableArray array];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _subTableView.delegate = self;
    _subTableView.dataSource = self;
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [_subTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    [self dissmiss];
}

-(void)dissmiss {
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _mainTableView) {
        return _mainDataSource.count;
    }else {
        return _subDataSource.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (tableView == _mainTableView) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"Cell-%ld",(long)indexPath.row];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"Cell-%ld",(long)indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == _mainTableView) {
        self.subDataSource = _mainDataSource[indexPath.row];
    }else {
        id obj = _subDataSource[indexPath.row];
        if ([self.delegate respondsToSelector:@selector(FilterSelectedDown:)]) {
            [self.delegate FilterSelectedDown:obj];
            [self dissmiss];
        }
    }
}

#pragma mark - Setter Getter
-(void)setSubDataSource:(NSMutableArray *)subDataSource {
    _subDataSource = subDataSource;
    [_subTableView reloadData];
}
@end
