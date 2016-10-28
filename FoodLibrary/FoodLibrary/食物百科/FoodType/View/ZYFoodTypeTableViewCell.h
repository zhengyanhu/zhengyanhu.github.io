//
//  ZYFoodTypeTableViewCell.h
//  FoodLibrary
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HealthType){
    
    HealthGreenType = 1,
    HealthYellowType = 2,
    HealthRedType = 3,
    
};

@interface ZYFoodTypeTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *foodImageView;

@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UILabel *detailLabel;

@property(nonatomic,strong) UILabel *healthLable;





@end
