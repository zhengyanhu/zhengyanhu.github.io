//
//  ZYNurientUIScrollView.m
//  FoodLibrary
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYNurientUIScrollView.h"

@implementation ZYNurientUIScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    if (self) {
        
        NSArray *nurients = [[NSArray alloc] initWithObjects:@"热量",@"蛋白质",@"脂肪",@"膳食纤维",@"碳水化合物",@"维生素A",@"维生素B1",@"维生素B2",@"维生素C",@"维生素E",@"烟酸",@"钠",@"钙",@"铁",@"钾",@"碘",@"锌",@"硒",@"镁",@"铜",@"锰",@"胆固醇", nil];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
        
        
        scrollView.contentSize = CGSizeMake(width, 240);
        
        scrollView.backgroundColor = [UIColor whiteColor];
        
        
       
        
        for (NSInteger a = 0; a < 9; a ++) {
            
            CALayer *nutrientLayer = [CALayer layer];
            
            nutrientLayer.frame = CGRectMake(0, a * 30, 375, 0.5);
            
            nutrientLayer.backgroundColor = [[UIColor colorWithRed:242 /255.0 green:242 /255.0 blue:242 /255.0 alpha:1] CGColor];
            
            [scrollView.layer addSublayer:nutrientLayer];
            
        }
        
        width = (width - 10 * 2 - 50 *2 )/ 3;
        
        for(NSInteger a = 0; a < nurients.count;a ++)
        {
            UILabel *nurientLabel = [[UILabel alloc] initWithFrame:CGRectMake(a % 3 * (width + 50)+10,a/3*(30)+ 5, 150, 20)];
            
            nurientLabel.text = nurients[a];
            
            nurientLabel.textAlignment= NSTextAlignmentLeft;
            
            nurientLabel.font = [UIFont systemFontOfSize:13];
            
            [scrollView addSubview:nurientLabel];
        }
        
         [self addSubview:scrollView];
    }
    return self;
}

@end
