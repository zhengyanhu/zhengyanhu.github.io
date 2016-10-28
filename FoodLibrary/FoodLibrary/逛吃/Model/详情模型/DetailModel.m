//
//  DetailModel.m
//  FoodLibrary
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
#pragma mark - mj

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    
    return [propertyName mj_underlineFromCamel];
}


+ (NSDictionary *)objectClassInArray{
    return @{@"units" : [UnitsAddress class], @"health_appraise" : [Health_AppraiseAddress class]};
}
@end
@implementation LightsModel

@end


@implementation CompareModel

@end


@implementation IngredientModel

@end


@implementation UnitsAddress

@end


@implementation Health_AppraiseAddress

@end


