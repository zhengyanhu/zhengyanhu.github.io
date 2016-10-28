//
//  ZYSearchField.h
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

@protocol ZYSearchFieldDelegate;


#import <UIKit/UIKit.h>

@interface ZYSearchField : UITextField

@property (nonatomic,weak) id <ZYSearchFieldDelegate> dateSource;

@property (nonatomic)BOOL isSkip;

@end

@protocol ZYSearchFieldDelegate <NSObject>

- (void)skipInterface;


@end