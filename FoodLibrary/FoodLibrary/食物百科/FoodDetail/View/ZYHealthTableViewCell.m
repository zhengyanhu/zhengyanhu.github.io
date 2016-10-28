//
//  ZYHealthTableViewCell.m
//  FoodLibrary
//
//  Created by mac on 16/8/25.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYHealthTableViewCell.h"

@implementation ZYHealthTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
        
        _healthColor = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 10, 10)];
        
        _healthColor.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:_healthColor];
        
        
        _healthConsult = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 20)];
        
        _healthConsult.text = @"1231321321231231321";
        
        [self.contentView addSubview:_healthConsult];
    }
    return self;
}

@end
