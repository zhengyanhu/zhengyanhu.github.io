//
//  ZYGuiDeView.h
//  FoodLibrary
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYGuiDeViewDelegate;

@interface ZYGuiDeView : UIView

@property (nonatomic,strong)UIView *backgroundView;

@property (strong,nonatomic)id <ZYGuiDeViewDelegate> delegate;

@end

@protocol ZYGuiDeViewDelegate <NSObject>

- (void)guiDeView:(ZYGuiDeView *)viewGuiDe didTapImageView:(UIImageView *)imageView;


@end
