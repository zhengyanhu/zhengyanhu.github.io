//
//  KnoTableViewCell.h
//  FoodLibrary
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnoTableViewCell : UITableViewCell
@property(nonatomic)NSInteger type;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * sourceLabel;
@property(nonatomic,strong)UILabel * tailLabel;
@property(nonatomic,strong)UIImageView * images;
@property(nonatomic,strong)UIView * view;
@end
