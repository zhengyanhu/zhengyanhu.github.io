//
//  ZYFoodTableViewCell.h
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYGuiDeView.h"
@interface ZYFoodTableViewCell : UITableViewCell

@property (strong,nonatomic)UIImageView *imageViewHead;

@property (strong,nonatomic)UILabel *foodLabel;

@property (strong,nonatomic)UILabel *PKLabel;

@property (strong,nonatomic)UILabel *titleLabel;

@property (strong,nonatomic)UILabel *label;

@property (strong,nonatomic)ZYGuiDeView *guiDeView;



@end
