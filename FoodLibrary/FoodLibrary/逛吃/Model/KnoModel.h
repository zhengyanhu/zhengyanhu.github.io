//
//  KnoModel.h
//  FoodLibrary
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KnoModel : NSObject
@property(nonatomic,strong)NSString * source;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * tail;
@property(nonatomic,strong)NSArray * images;
@property(nonatomic)NSInteger contentType;
@end
