//
//  ZYNurientValue.h
//  FoodLibrary
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYUnits.h"
#import "ZYCoreFood.h"

@interface ZYNurientValue : NSObject

@property (nonatomic,strong)NSString *weight;

@property (nonatomic,strong)NSString *calory;

@property (nonatomic,strong)NSString *protein;

@property (nonatomic,strong)NSString *fat;

@property (nonatomic,strong)NSString *fiberDietary;

@property (nonatomic,strong)NSString *carbohydrate;

@property (nonatomic,strong)NSString *caloryStar;

@property (nonatomic,strong)NSString *caloryStarTag;

@property (nonatomic,strong)NSString *satietyStar;

@property (nonatomic,strong)NSString *satietyStarTag;

@property (nonatomic,strong)NSString *healthyStar;

@property (nonatomic,strong)NSString *appraise;

@property (nonatomic,strong)NSString *reduceWeightStar;

@property (nonatomic)NSInteger healthLight;

@property (nonatomic,strong)NSString *sPoints;

@property (nonatomic,strong)NSArray <ZYUnits *> *units;

@property (nonatomic,strong)ZYCoreFood *coreFood;



@end
