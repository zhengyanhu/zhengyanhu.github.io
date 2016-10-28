//
//  ZYGuiDeViewController.h
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

@protocol ZYGuiDeViewControllerDelegate;



#import <UIKit/UIKit.h>

@protocol ZYGuiDeViewControllerDelegate <NSObject>


- (void)goMain;
@end

@interface ZYGuiDeViewController : UIViewController

@property (nonatomic,weak) id <ZYGuiDeViewControllerDelegate> delegate;


@end
