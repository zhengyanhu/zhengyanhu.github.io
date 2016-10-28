//
//  ZYSearchField.m
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYSearchField.h"

@interface ZYSearchField ()<UITextFieldDelegate>

@end

@implementation ZYSearchField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        

            self.frame = CGRectMake(0, 0, 300, 30);
            
            self.font = [UIFont systemFontOfSize:14];
            
            self.placeholder = @"请输入食物名称";
            
            self.textAlignment = NSTextAlignmentLeft;
            
            self.borderStyle = UITextBorderStyleRoundedRect;
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            
            imageView.image = [UIImage imageNamed:@"ic_search"];

            self.leftView = imageView;
            
            self.leftViewMode = UITextFieldViewModeAlways;
        
            self.delegate = self;
    }
    return self;
}

+ (instancetype)init
{
    return [[ self alloc] init];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
       if (_isSkip) {
        
       
        return YES;
        
    }else
    {
        if (_dateSource &&[_dateSource respondsToSelector:@selector(skipInterface)]) {
            
            [_dateSource skipInterface];
            
        }

        return NO;
    }
    
  
}

@end
