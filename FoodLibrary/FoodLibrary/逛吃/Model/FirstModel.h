//
//  FirstModel.h
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstModel : NSObject
@property(nonatomic)NSInteger itemID;
@property(nonatomic,strong)NSURL * avatar;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * publisher;
@property(nonatomic,strong)NSURL * cardImage;

@end
