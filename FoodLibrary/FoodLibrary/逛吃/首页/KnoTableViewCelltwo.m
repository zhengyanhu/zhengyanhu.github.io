//
//  KnoTableViewCelltwo.m
//  FoodLibrary
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "KnoTableViewCelltwo.h"

@implementation KnoTableViewCelltwo

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
        
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, width, 20)];
        _titleLabel.numberOfLines=0;
        [_view addSubview:_titleLabel];
        
        for (int a=0; a<3; a++)
        {
            UIImageView * imageview=[[UIImageView alloc] initWithFrame:CGRectMake(space+(imagewidth+space)*a, CGRectGetMaxY(_titleLabel.frame)+5, imagewidth, 60)];
            imageview.tag=a+1;
            [_view addSubview:imageview];
        }
        _sourceLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 15)];
        _sourceLabel.font=[UIFont systemFontOfSize:13];
        _sourceLabel.textColor=[UIColor lightGrayColor];
        [_view addSubview:_sourceLabel];
        
        _tailLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_sourceLabel.frame)+5, 100, 45, 15)];
        _tailLabel.textColor=[UIColor lightGrayColor];
        _tailLabel.font=[UIFont systemFontOfSize:13];
        [_view addSubview:_tailLabel];
        

        
    }
    
    return self;
}

@end
