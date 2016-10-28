//
//  FoodParatemerTableViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "FoodParatemerTableViewCell.h"

@implementation FoodParatemerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 30)];
        _nameLabel.textColor=[UIColor blackColor];
        _nameLabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLabel];
        
        _numLabel=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 80, 30)];
        _numLabel.textColor=[UIColor blackColor];
        _numLabel.font=[UIFont systemFontOfSize:14];

        [self.contentView addSubview:_numLabel];
        
        _remarkLabel=[[UILabel alloc] initWithFrame:CGRectMake(280, 10, 80, 30)];
        _remarkLabel.font=[UIFont systemFontOfSize:14];

        _remarkLabel.textColor=[UIColor redColor];
        [self.contentView addSubview:_remarkLabel];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
