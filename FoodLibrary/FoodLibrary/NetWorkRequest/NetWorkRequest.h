//
//  NetWorkRequest.h
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^blocker)(NSError * _Nullable error,id _Nullable responseObject);


@interface NetWorkRequest : NSObject

+(void)requestFirstPageContentWithPage:(NSInteger)page block:(blocker)complete;
+(void)requestEvalutionContentWithPage:(NSInteger)page block:(blocker)complete;
+(void)requestKnoContentWithPage:(NSInteger)page block:(blocker)complete;
+(void)requestPhotoDetailWith:(NSInteger)itemId block:(blocker)complete;
+(void)requestDetailContentWith:(NSString*)foodcode block:(blocker)complete;



+(void)requestGuideContent:(NSString *)url block:(blocker)complete;

+(void)requestClassFoodValue:(NSNumber *)value withKind:(NSString *)kind withPage:(NSNumber *)page block:(blocker)complete;

+(void)requestIFoodWithCode:(NSString *)code block:(blocker)complete;

@end
NS_ASSUME_NONNULL_END