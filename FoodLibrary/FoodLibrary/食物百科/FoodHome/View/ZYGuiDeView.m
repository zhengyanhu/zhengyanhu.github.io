//
//  ZYGuiDeView.m
//  FoodLibrary
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYGuiDeView.h"

@implementation ZYGuiDeView

 - (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
       _backgroundView = [[UIView alloc] initWithFrame:frame];
        
        _backgroundView.clipsToBounds = YES;
        
        [self addSubview:_backgroundView];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        CGFloat imageWidth = (width - 30 * 2 - 50 * 2) / 3;
        for (NSInteger a = 0; a <13; a ++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(a % 3 *(imageWidth + 50) + 32, a/3*(imageWidth + 40), imageWidth , imageWidth))];
            
            imageView.tag = a +1;
                     
            //button.backgroundColor = [UIColor redColor];
            
           
            
            imageView.userInteractionEnabled = YES;
            
           
                     
            [_backgroundView addSubview:imageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            
            [imageView addGestureRecognizer:tap];
            
           UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(imageView.frame) - 12, CGRectGetMaxY(imageView.frame)+ 10, 100, 21)];
            
            label.tag = a + 20;
            
            label.font = [UIFont systemFontOfSize:12];
            
            label.textAlignment = NSTextAlignmentCenter;
            
           // _label.backgroundColor = [UIColor blackColor];
            
            label.textColor = [UIColor blackColor];
            
            
            [_backgroundView addSubview:label];
    }
        
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(guiDeView:didTapImageView:)]) {
        
        [_delegate guiDeView:self didTapImageView:imageView];
    }
    
}



@end
