//
//  ZYFoodNutritionTableViewCell.m
//  FoodLibrary
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYFoodNutritionTableViewCell.h"
#import "ZYNurientValue.h"
@implementation ZYFoodNutritionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        CGFloat width =[UIScreen mainScreen].bounds.size.width;
        
       _nurtitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, width, 180)];
        
        
        for (NSInteger a = 0; a < 5; a ++) {
            
            UILabel *labelTile = [[UILabel alloc] initWithFrame:CGRectMake(10, a *30, 70, 30)];
            labelTile.tag = a + 1;
           // labelTile.backgroundColor = [UIColor redColor];
            labelTile.font = [UIFont systemFontOfSize:14];
            labelTile.textAlignment = NSTextAlignmentLeft;
              labelTile.textColor = [UIColor blackColor];
            [_nurtitionView addSubview:labelTile];

        }
        for (NSInteger a = 0; a < 5; a ++) {
            
            UILabel *labelNutrition = [[UILabel alloc] initWithFrame:CGRectMake( 160, a *30, 70, 30)];
            labelNutrition.tag = a + 10;
            //labelNutrition.backgroundColor = [UIColor redColor];
            labelNutrition.font = [UIFont systemFontOfSize:14];
            labelNutrition.textAlignment = NSTextAlignmentLeft;
            labelNutrition.textColor = [UIColor blackColor];
            [_nurtitionView addSubview:labelNutrition];
            
        }

        for (NSInteger a = 0; a < 4; a ++) {
            
            UILabel *labelRemark = [[UILabel alloc] initWithFrame:CGRectMake( 320, a * 30, 70, 30)];
            labelRemark.tag = a + 20;
           // labelRemark.backgroundColor = [UIColor redColor];
            labelRemark.font = [UIFont systemFontOfSize:14];
            labelRemark.textAlignment = NSTextAlignmentLeft;
            labelRemark.textColor = [UIColor magentaColor];
            [_nurtitionView addSubview:labelRemark];

        }
        
        for (NSInteger a = 0; a < 6; a ++) {
            
            CALayer *nurtitionViewLayer = [CALayer layer];
            
            nurtitionViewLayer.frame = CGRectMake(10, 30 *(a+1), width-20, 0.5);
            
            nurtitionViewLayer.backgroundColor = [UIColor grayColor].CGColor;
            
            [_nurtitionView.layer addSublayer:nurtitionViewLayer];

        }
        
        
        _buttonMore = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, width, 30)];
        
        _buttonMore.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _buttonMore.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_buttonMore setTitle:@"更多营养元素" forState:UIControlStateNormal];
        
        [_buttonMore setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [_nurtitionView addSubview:_buttonMore];
        
        [self.contentView addSubview:_nurtitionView];
        
    }
    
    
    return self;
}




@end
