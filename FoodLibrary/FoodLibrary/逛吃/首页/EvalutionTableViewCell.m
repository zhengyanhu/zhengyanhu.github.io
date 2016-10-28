//
//  EvalutionTableViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "EvalutionTableViewCell.h"

@implementation EvalutionTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CGFloat screen=[UIScreen mainScreen].bounds.size.width;
        
        self.backgroundColor=[UIColor whiteColor];
        _evalutionImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen-40, 200)];
        [self.contentView addSubview:_evalutionImageView];
        
        _source=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, screen-40, 30)];
        _source.textAlignment=NSTextAlignmentCenter;
        _source.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_source];
        
        _evaTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 75, screen-40, 50)];
        _evaTitle.textAlignment=NSTextAlignmentCenter;
        _evaTitle.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_evaTitle];
        
        _tail=[[UILabel alloc] initWithFrame:CGRectMake(0, 160, screen-40, 30)];
        _tail.textAlignment=NSTextAlignmentCenter;
        _tail.textColor=[UIColor whiteColor];
        [self.contentView addSubview:_tail];
        
    }
    
    return self;
    
    
    
}
@end
