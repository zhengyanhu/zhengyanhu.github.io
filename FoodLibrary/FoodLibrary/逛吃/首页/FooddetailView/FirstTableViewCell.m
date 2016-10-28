//
//  FirstTableViewCell.m
//  FoodLibrary
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "FirstTableViewCell.h"
@interface FirstTableViewCell ()
{
    NSArray * titleArray;
    
}
@end
@implementation FirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    { titleArray=[[NSArray alloc] initWithObjects:@"+添加记录",@"+加入对比", nil];
        
        UIView * backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 150)];
        backgroundView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:backgroundView];
        
        _heardView=[[UIView alloc] initWithFrame:CGRectMake(10, 0, 375-20, 80)];
        _heardView.backgroundColor=[UIColor redColor];
        [backgroundView addSubview:_heardView];
        
        _heardImageview=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _heardImageview.clipsToBounds=YES;
        _heardImageview.layer.cornerRadius=25;
      
        [_heardView addSubview:_heardImageview];

        
        _nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_heardImageview.frame)+10, 10, 300, 20)];
        _nameLabel.textColor=[UIColor blackColor];
        _nameLabel.font=[UIFont systemFontOfSize:12];
        [_heardView addSubview:_nameLabel];

       _caLabel =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_heardImageview.frame)+10, CGRectGetMaxY(_nameLabel.frame)+5, 300, 30)];
        _caLabel.font=[UIFont systemFontOfSize:20];
        [_heardView addSubview:_caLabel];

        CGFloat space=20;
        
        CGFloat width=(375-20*3)/2;
        for (int a=0; a<2; a++)
        {
            UIButton * button=[[UIButton alloc] initWithFrame:CGRectMake((space+width)*a+space, CGRectGetMaxY(_heardView.frame)+25, width, 40)];
            [button setTitle:titleArray[a] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.backgroundColor=[UIColor greenColor];
            [backgroundView addSubview:button];
        }

        
        
    }
    return self;
}
@end
