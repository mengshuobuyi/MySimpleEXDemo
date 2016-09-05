//
//  FilterManager.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FilterDelegate <NSObject>
-(void)FilterSelectedDown:(id)obj;
@end
@interface FilterManager : UIView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;
@property (nonatomic,weak)id <FilterDelegate> delegate;
/*
 * 初始化筛选manager，param datasource
 */
+(FilterManager *)createFilterManagerWith:(NSArray *)dataSource;

-(void)dissmiss;
@end
