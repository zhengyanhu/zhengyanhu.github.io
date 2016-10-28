//
//  ThirdTableViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ThirdTableViewCell.h"

@implementation ThirdTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _GILabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
        _GILabel.textColor=[UIColor redColor];
        _GILabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_GILabel];
        
        _GInum=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, 80, 30)];
        _GInum.textColor=[UIColor redColor];
        _GInum.font=[UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:_GInum];
        
        _GIheight=[[UILabel alloc] initWithFrame:CGRectMake(280, 10, 80, 30)];
        _GIheight.font=[UIFont systemFontOfSize:14];
        
        _GIheight.textColor=[UIColor redColor];
        [self.contentView addSubview:_GIheight];
    }
    return self;
}
@end
