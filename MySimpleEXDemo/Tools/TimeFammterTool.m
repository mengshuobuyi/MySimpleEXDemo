//
//  TimeFammterTool.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "TimeFammterTool.h"

@implementation TimeFammterTool
/*时间显示规则如下：
 1)   发布时间小于1分钟，显示：刚刚
 2)   1分钟≤发布时间<1小时，显示：mm分钟前
 3)   1小时≦发布时间，并且在今天0：00后的，显示：今天 hh：mm
 4)   发布时间在今天0：00前的，且在今年的，显示：MM-DD
 5)   发布年份≦当前年份，显示：YY-MM-DD
 */
+ (NSString *)timeWithComparedTime:(NSString *)aTime {
    //aTime 格式 2014-10-15 10:13:24
    if (!aTime) {
        return @"";
    }
    if (aTime.length != 19) {
        return aTime;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nowTime = [NSDate date];
    NSDate *compareDate = [formatter dateFromString:aTime];
    NSString *nowTimeStr = [formatter stringFromDate:nowTime];
    NSTimeInterval interval = fabs([nowTime timeIntervalSinceDate:compareDate]);
    if (interval <= 0) {
        return [aTime substringToIndex:10];
    } else if (interval < 60 && interval > 0) {
        return @"刚刚";
    } else if (interval >= 60 && interval < 60 * 60 ) {
        return [NSString stringWithFormat:@"%d分钟前", (int)(interval/60)];
    } else if (interval >= 60 * 60 && [[aTime substringToIndex:10] isEqualToString:[nowTimeStr substringToIndex:10]]) {
        NSRange range = NSMakeRange(11, 5);
        NSString *todayTime = [aTime substringWithRange:range];
        return [NSString stringWithFormat:@"今天 %@",todayTime];
    } else if ([[aTime substringToIndex:4] isEqualToString:[nowTimeStr substringToIndex:4]]) {
        NSRange range = NSMakeRange(5, 5);
        NSString *monthStr = [aTime substringWithRange:range];
        return monthStr;
    } else if (![[aTime substringToIndex:4] isEqualToString:[nowTimeStr substringToIndex:4]]) {
        return [aTime substringToIndex:10];
    }
    return [aTime substringToIndex:10];
}

+ (NSString *)timeStringFromNumber:(NSNumber *)numberTime {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:numberTime.longLongValue/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)timeFormatStringFromNumber:(NSString *)numberTime {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:numberTime.longLongValue/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    return [self timeWithComparedTime:dateStr];
}

+ (NSString *)timeFormatted:(long)totalSeconds {
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = (int)(totalSeconds / 3600);
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

+ (NSString *)timeStringFromTimeStamp:(NSNumber *)timestamp withFormatter:(NSString *)formatString {
    if (!timestamp) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)customTimerWithTimeStr:(NSString *)aTime {
    //aTime格式：yy-MM-dd hh:mm
    if (!aTime) {
        return @"";
    }
    if (aTime.length != 16) {
        return aTime;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [fmt dateFromString:aTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *convertTime = [formatter stringFromDate:date];
    if (convertTime.length != 19) {
        return aTime;
    }
    return [self timeWithComparedTime:convertTime];
}
@end
