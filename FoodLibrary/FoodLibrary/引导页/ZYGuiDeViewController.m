//
//  ZYGuiDeViewController.m
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYGuiDeViewController.h"

#import "AppDelegate.h"

@interface ZYGuiDeViewController ()

@end

@implementation ZYGuiDeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIScrollView *guiDeScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    guiDeScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height);
    
    for (NSInteger a = 0; a < 5; a ++) {
        
        UIImageView *guiDeImage = [[UIImageView alloc] initWithFrame:CGRectMake(a * self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height)];
        
        UIImage *imageName = [UIImage imageNamed:[NSString stringWithFormat:@"img_intro_%ld",a + 1]];
        
        guiDeImage.image = imageName;
        
        
        [guiDeScrollView addSubview:guiDeImage];
        
    }
    
    guiDeScrollView.pagingEnabled = YES;
    
    guiDeScrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:guiDeScrollView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(self.view.frame.size.width * 3 + 130, 500, 120, 25);
    
    button.backgroundColor = [UIColor blackColor];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"开启美食之旅" forState:UIControlStateNormal];
    
    [guiDeScrollView addSubview:button];
    
    
}

#pragma mark--buttonClick
- (void)buttonClick:(UIButton *)sender
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(goMain)]) {
        
        NSUserDefaults *db =[NSUserDefaults standardUserDefaults];
        
        [db setBool:YES forKey:@"guide"];
        
        [db synchronize];
        
        [_delegate goMain];
    }
}


@end
