//
//  DetailModel.h
//  FoodLibrary
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>


@class LightsModel,CompareModel,IngredientModel,UnitsAddress,Health_AppraiseAddress;
@interface DetailModel : NSObject

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *appraise;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, assign) NSInteger commentsCt;

@property (nonatomic, copy) NSString *thumbImageUrl;

@property (nonatomic, copy) NSString *carbohydrate;

@property (nonatomic, strong) LightsModel *lights;

@property (nonatomic, assign) NSInteger healthLight;

@property (nonatomic, assign) BOOL isLiquid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *fat;

@property (nonatomic, copy) NSString *gi;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *largeImageUrl;

@property (nonatomic, strong) NSArray<UnitsAddress *> *units;

@property (nonatomic, strong) CompareModel *compare;

@property (nonatomic, copy) NSString *uploader;

@property (nonatomic, copy) NSString *protein;

@property (nonatomic, copy) NSString *recipeType;

@property (nonatomic, strong) NSArray<Health_AppraiseAddress *> *healthAppraise;

@property (nonatomic, copy) NSString *gl;

@property (nonatomic, copy) NSString *calory;

@property (nonatomic, assign) BOOL recipe;

@property (nonatomic, copy) NSString *fiberDietary;

@property (nonatomic, strong) IngredientModel *ingredient;




@end
@interface LightsModel : NSObject

@property (nonatomic, copy) NSString *calory;

@property (nonatomic, copy) NSString *protein;

@property (nonatomic, copy) NSString *fat;

@property (nonatomic, copy) NSString *fiberDietary;

@property (nonatomic, copy) NSString *carbohydrate;

@property (nonatomic, copy) NSString *gi;

@property (nonatomic, copy) NSString *gl;

@end

@interface CompareModel : NSObject

@end

@interface IngredientModel : NSObject

@property (nonatomic, copy) NSString *cholesterol;

@property (nonatomic, copy) NSString *carotene;

@property (nonatomic, copy) NSString *zinc;

@property (nonatomic, copy) NSString *copper;

@property (nonatomic, copy) NSString *niacin;

@property (nonatomic, copy) NSString *kalium;

@property (nonatomic, copy) NSString *vitaminA;

@property (nonatomic, copy) NSString *carbohydrate;

@property (nonatomic, copy) NSString *vitaminC;

@property (nonatomic, copy) NSString *vitaminE;

@property (nonatomic, copy) NSString *fat;

@property (nonatomic, copy) NSString *calcium;

@property (nonatomic, copy) NSString *phosphor;

@property (nonatomic, copy) NSString *magnesium;

@property (nonatomic, copy) NSString *manganese;

@property (nonatomic, copy) NSString *selenium;

@property (nonatomic, copy) NSString *lactoflavin;

@property (nonatomic, copy) NSString *protein;

@property (nonatomic, copy) NSString *iron;

@property (nonatomic, copy) NSString *calory;

@property (nonatomic, copy) NSString *thiamine;

@property (nonatomic, copy) NSString *natrium;

@property (nonatomic, copy) NSString *fiberDietary;

@end

@interface UnitsAddress : NSObject

@property (nonatomic, copy) NSString *amount;

@property (nonatomic, copy) NSString *calory;

@property (nonatomic, copy) NSString *eatWeight;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, assign) NSInteger unitId;

@property (nonatomic, copy) NSString *unit;

@end

@interface Health_AppraiseAddress : NSObject

@property (nonatomic, assign) NSInteger healthMode;

@property (nonatomic, assign) NSInteger light;

@property (nonatomic, assign) NSInteger show;

@property (nonatomic, copy) NSString *appraise;

@end

