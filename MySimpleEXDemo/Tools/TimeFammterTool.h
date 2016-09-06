//
//  TimeFammterTool.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeFammterTool : NSObject
/**
 *  根据yyyy-MM-dd hh:mm:ss的时间格式得到定制时间格式（刚刚，今天等等的时间格式）
 *
 *  @param aTime 格式为yyyy-MM-dd hh:mm:ss的时间字符串
 *
 *  @return 定制的时间字符串（刚刚、xx分钟前、今天）
 */
+ (NSString *)timeWithComparedTime:(NSString *)aTime;
/**
 *  根据时间戳得到时间格式（yyyy-MM-dd的时间格式）
 *
 *  @param numberTime 时间戳
 *
 *  @return yyyy-MM-dd 格式的时间字符串
 */
+ (NSString *)timeStringFromNumber:(NSNumber *)numberTime;
/**
 *  根据时间戳得到定制的时间字符串（刚刚、xx分钟前、今天）
 *
 *  @param numberTime 时间戳字符串
 *
 *  @return 定制的时间字符串（刚刚、xx分钟前、今天）
 */
+ (NSString *)timeFormatStringFromNumber:(NSString *)numberTime;
/**
 *  时间戳转成hh:mm:ss格式的时间字符串。e.g 21:32:07
 *
 *  @param totalSeconds 时间戳
 *
 *  @return 格式字符串
 */
+ (NSString *)timeFormatted:(long)totalSeconds;
/**
 *  时间戳转对应时间格式的字符串
 *
 *  @param timestamp    时间戳
 *  @param formatString 格式，比如yyyy-MM-dd hh:mm:ss
 *
 *  @return 时间字符串
 */
+ (NSString *)timeStringFromTimeStamp:(NSNumber *)timestamp withFormatter:(NSString *)formatString;
/**
 *  时间字符串格式为yyyy-MM-dd hh:mm 转自定义时间（xx分钟前，今天xx：xx）
 *
 *  @param aTime 格式为yyyy-MM-dd hh:mm 的时间字符串
 *
 *  @return 自定义时间（xx分钟前，今天xx：xx）
 */
+ (NSString *)customTimerWithTimeStr:(NSString *)aTime;
@end
