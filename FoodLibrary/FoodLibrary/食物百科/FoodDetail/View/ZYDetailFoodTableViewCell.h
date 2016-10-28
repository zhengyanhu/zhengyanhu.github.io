//
//  ZYDetailFoodTableViewCell.h
//  FoodLibrary
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYDetailFoodTableViewCell : UITableViewCell

@property (nonatomic,strong)UIView *detailView ;

@property (nonatomic,strong)UIImageView *headerImageView;

@property (nonatomic,strong)UILabel *detailLabel;

@property (nonatomic,strong)UILabel *nameLabel;

@property (nonatomic,strong)UIButton *recordButton;

@property (nonatomic,strong)UIButton *contrastButton;

@property (nonatomic,strong) CALayer *layerRecordButton;


@end
