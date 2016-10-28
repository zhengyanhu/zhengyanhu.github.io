//
//  ZYUnits.m
//  FoodLibrary
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYUnits.h"
#import <MJExtension.h>
@implementation ZYUnits

+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    
    return [propertyName mj_underlineFromCamel];
}


@end
