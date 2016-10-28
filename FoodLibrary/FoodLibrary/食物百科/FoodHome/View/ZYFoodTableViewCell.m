//
//  ZYFoodTableViewCell.m
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYFoodTableViewCell.h"

@implementation ZYFoodTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _imageViewHead = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:_imageViewHead];
        
        _foodLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imageViewHead.frame) + 10, 10, 120, 25)];
        _foodLabel.textColor = [UIColor blackColor];
        _foodLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_foodLabel];
        
        _PKLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imageViewHead.frame) + 10, CGRectGetMaxY(_foodLabel.frame), 150, 20)];
                                                             
        _PKLabel.textAlignment = NSTextAlignmentLeft;
        
        _PKLabel.font = [UIFont systemFontOfSize:14];
        
        _PKLabel.textColor = [UIColor colorWithRed:140 / 255.0 green:140 / 255.0 blue:140 / 255.0 alpha:1];
        [self.contentView addSubview:_PKLabel];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 75, 20)];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.font = [UIFont systemFontOfSize:15];
        
        _titleLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:_titleLabel];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_titleLabel.frame) + 22, CGRectGetMaxY(_titleLabel.frame), 32, 3)];
    
        _label.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_label];
        
        _guiDeView = [[ZYGuiDeView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_label.frame) - 10,[UIScreen mainScreen].bounds.size.width, 460)];
        
       // _guiDeView.backgroundColor = [UIColor cyanColor];
        
        [self.contentView addSubview:_guiDeView];
        
    }
    
    return self;
}

@end
