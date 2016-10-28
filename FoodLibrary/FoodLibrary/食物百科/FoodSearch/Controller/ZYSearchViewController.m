//
//  ZYSearchViewController.m
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYSearchViewController.h"
#import "ZYSearchField.h"
@interface ZYSearchViewController ()

@end

@implementation ZYSearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:YES];
    
    ZYSearchField *search = [[ZYSearchField alloc] init];
    
   
    
    search.isSkip = YES;
    
    search.leftView = nil;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = [UIImage imageNamed:@"ic_search"];

    search.rightView = imageView;
    
    search.rightViewMode = UITextFieldViewModeAlways;
    
    search.borderStyle = UITextBorderStyleNone;
    
    [search becomeFirstResponder];
    
    self.navigationItem.titleView =search;
    
    [self customBackButton];
}

- (void)customBackButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 20, 30);
    
    [button setImage:[UIImage imageNamed:@"ic_back_search"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
                        
}


#pragma mark--backButton
- (void)backButton
{
    
    
    [self.navigationController popViewControllerAnimated:NO];
}

@end
