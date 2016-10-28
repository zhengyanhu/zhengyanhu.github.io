//
//  KnoTableViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/2.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "KnoTableViewCell.h"

@implementation KnoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor=[UIColor lightGrayColor];
        CGFloat width=[UIScreen mainScreen].bounds.size.width;
        CGFloat space=10;
        CGFloat imagewidth=(width-4*space)/3;
        
         _view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 120)];
        _view.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_view];
       
        
            _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, width-140, 60)];
            _titleLabel.numberOfLines=0;
            [_view
             
             addSubview:_titleLabel];
            
            _sourceLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_titleLabel.frame)+10, 200, 20)];
            _sourceLabel.font=[UIFont systemFontOfSize:13];
            _sourceLabel.textColor=[UIColor lightGrayColor];
            [_view addSubview:_sourceLabel];
            _tailLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_sourceLabel.frame)+5, CGRectGetMaxY(_titleLabel.frame)+10, 45, 20)];
            _tailLabel.textColor=[UIColor lightGrayColor];
            _tailLabel.font=[UIFont systemFontOfSize:13];
            [_view addSubview:_tailLabel];
            _images=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame)+10, 20, imagewidth, 60)];
            [_view addSubview:_images];

    }
    
    return self;
}
@end
