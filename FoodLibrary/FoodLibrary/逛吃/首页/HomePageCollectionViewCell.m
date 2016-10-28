//
//  HomePageCollectionViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "HomePageCollectionViewCell.h"

@implementation HomePageCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        _foodImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height-60)];
        [self.contentView addSubview:_foodImageView];
        _heardImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_foodImageView.frame)+10, 40, 40)];
        _heardImageView.clipsToBounds=YES;
        _heardImageView.layer.cornerRadius=20;
        [self.contentView addSubview:_heardImageView];
        
        _foodName=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_heardImageView.frame)+10, CGRectGetMaxY(_foodImageView.frame)+10, self.contentView.frame.size.width-60, 20)];
        [self.contentView addSubview:_foodName];
        
        _foodMaster=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_heardImageView.frame)+10, CGRectGetMaxY(_foodName.frame)+5, self.contentView.frame.size.width-60, 15)];
        _foodMaster.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_foodMaster];
        
    }
    return self;
}
@end
