//
//  ZYFoodTypeTableViewCell.m
//  FoodLibrary
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYFoodTypeTableViewCell.h"

@implementation ZYFoodTypeTableViewCell

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
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        _foodImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 45, 45)];
        
        _foodImageView.layer.cornerRadius = 5;
        
        _foodImageView.clipsToBounds = YES;
        
        [self.contentView addSubview:_foodImageView];
        
       _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_foodImageView.frame)+5, CGRectGetMinY(_foodImageView.frame), 300, 20)];
        
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        _nameLabel.font = [UIFont systemFontOfSize:16];
        
        [self.contentView addSubview:_nameLabel];
        
        
       _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_foodImageView.frame) + 5, CGRectGetMaxY(_nameLabel.frame)+5, 300, 13)];
        
        
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        
        _detailLabel.font = [UIFont systemFontOfSize:13];
        
        [self.contentView addSubview:_detailLabel];
        
        
        _healthLable = [[UILabel alloc] initWithFrame:CGRectMake(width - 30, CGRectGetMidY(_foodImageView.frame), 10, 10)];
        
        _healthLable.backgroundColor = [UIColor greenColor];
        
        _healthLable.layer.cornerRadius = 5;
        
        _healthLable.clipsToBounds = YES;
        
        [self.contentView addSubview:_healthLable];
        
    }
    
    return self;
}


@end
