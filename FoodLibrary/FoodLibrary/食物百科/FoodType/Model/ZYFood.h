//
//  ZYFood.h
//  FoodLibrary
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#
@interface ZYFood : NSObject

@property (nonatomic,strong)NSString *name;

@property (nonatomic,strong)NSString *thumbImageUrl;

@property (nonatomic,strong)NSString *weight;

@property (nonatomic,strong)NSString *calory;

@property (nonatomic,strong)NSString *code;

@property (nonatomic,strong)NSString *healthLight;

@property (nonatomic,strong) NSMutableAttributedString *attributedCalory;

@property (nonatomic,strong) NSMutableAttributedString *attributedCaloryDetail;

- (void)attributedText;

- (void)attributedTextDetailLabel;

@end
