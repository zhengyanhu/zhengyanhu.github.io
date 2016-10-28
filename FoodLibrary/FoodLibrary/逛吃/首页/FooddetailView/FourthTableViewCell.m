//
//  FourthTableViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "FourthTableViewCell.h"

@implementation FourthTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _lightLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 60, 20)];
        _lightLabel.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_lightLabel];
        
        _lightView=[[UIView alloc] initWithFrame:CGRectMake(10, 50, 20, 20)];
        _lightView.clipsToBounds=YES;
        _lightView.layer.cornerRadius=10;
        [self.contentView addSubview:_lightView];
        
        _eatLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_lightView.frame)+5, 50, 30, 30)];
        _eatLabel.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_eatLabel];
        
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 30, 375-100, 80)];
        _contentLabel.numberOfLines=0;
        [self.contentView addSubview:_contentLabel];
    }
    return self;
}

@end
