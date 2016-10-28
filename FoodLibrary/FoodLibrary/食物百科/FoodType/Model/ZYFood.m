//
//  ZYFood.m
//  FoodLibrary
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYFood.h"
#import <MJExtension.h>
#import <UIKit/UIKit.h>
@implementation ZYFood

+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName mj_underlineFromCamel];
}


- (void)attributedText
{
     _calory = [NSString stringWithFormat:@"%@ 千卡/%@克",_calory,_weight];
    
    _attributedCalory = [[NSMutableAttributedString alloc] initWithString:_calory];
    
    [_attributedCalory addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:247 / 255.0 green:23 / 255.0  blue:46 / 255.0 alpha:1]  range:NSMakeRange(0, _calory.length - 4 - _weight.length)];
    
}

- (void)attributedTextDetailLabel
{
    
    _attributedCaloryDetail = [[NSMutableAttributedString alloc] initWithString:_calory];
    
    [_attributedCaloryDetail addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0,  _calory.length - 2 - _weight.length)];

}

@end
