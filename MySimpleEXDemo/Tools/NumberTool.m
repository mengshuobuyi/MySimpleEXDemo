//
//  NumberTool.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/9/6.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "NumberTool.h"

@implementation NumberTool

+(NSString *)converToCnNumber:(NSNumber *)number {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    numberFormatter.numberStyle = NSNumberFormatterSpellOutStyle;
    NSString *cnNum = [numberFormatter stringFromNumber:number];
    return cnNum;
}

@end
