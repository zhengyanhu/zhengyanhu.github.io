//
//  ZYDetailFoodTableViewCell.m
//  FoodLibrary
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYDetailFoodTableViewCell.h"

@interface ZYDetailFoodTableViewCell ()
{
    UILabel *_label;
}

@end

@implementation ZYDetailFoodTableViewCell

- (void)awakeFromNib {
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
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        _detailView = [[UIView alloc] initWithFrame:CGRectMake(10, -10, width - 30, 75)];
        
        [self.contentView addSubview:_detailView];
        
        CALayer *layer = [_detailView layer];
        layer.borderColor = [[UIColor whiteColor] CGColor];
        layer.borderWidth = 3.0f;
        
        _detailView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _detailView.layer.shadowOffset = CGSizeMake(4, 4);
        _detailView.layer.shadowOpacity = 0.3;
        _detailView.layer.shadowRadius = 3.0;
        
        
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 45, 45)];
        
        _headerImageView.clipsToBounds = YES;
        
        _headerImageView.layer.cornerRadius =  45 /2;
        
        //_headerImageView.backgroundColor = [UIColor blackColor];
        
        [_detailView addSubview:_headerImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+5, CGRectGetMinY(_headerImageView.frame), 200, 20)];
        
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        //_nameLabel.backgroundColor = [UIColor magentaColor];
        
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
        [_detailView addSubview:_nameLabel];
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+5, CGRectGetMaxY(_nameLabel.frame), 200, 30)];
        
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        
       // _detailLabel.backgroundColor = [UIColor cyanColor];
        
        _detailLabel.font = [UIFont systemFontOfSize:13];
        
        [_detailView addSubview:_detailLabel];
        
         NSArray *array = [[NSArray alloc] initWithObjects:@"千卡",@"千焦", nil];
        for (NSInteger a= 0; a < 2; a ++) {
            
            UIButton *calorieButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [calorieButton setTitle:[array objectAtIndex:a] forState:UIControlStateNormal];
            
            [calorieButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            calorieButton.tag =a+1;
            
            calorieButton.titleLabel.font = [UIFont systemFontOfSize:15];
            
            calorieButton.frame = CGRectMake(( 260 + a * 40), CGRectGetMinY(_detailLabel.frame), 30, 22);
            
            [calorieButton addTarget:self action:@selector(calorieButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_detailView addSubview:calorieButton];
        }
         
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake( 260,  70, 30, 3)];
        
        label.backgroundColor = [UIColor colorWithRed:219/ 255.0 green:87/255.0 blue:94/255.0 alpha:1];
        
        [_detailView addSubview:label];
       
        _label = label;
        
        _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat recordButtonWidth = (width - 30 )/ 2 - 10 ;
        
        _recordButton.frame = CGRectMake(CGRectGetMinX(_detailView.frame) + 5, CGRectGetMaxY(_detailView.frame) + 30,recordButtonWidth , 30);
        
        _recordButton.tag = 5;
        
      //  _recordButton.backgroundColor = [UIColor yellowColor];
        
        [_recordButton setTitle:@"+添加记录" forState:UIControlStateNormal];
        
        [_recordButton setTitleColor:[UIColor colorWithRed:154 / 255.0 green:97 / 255.0 blue:101 / 255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_recordButton];
        
        
        _contrastButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _contrastButton.frame = CGRectMake(CGRectGetMaxX(_recordButton.frame) + 15, CGRectGetMaxY(_detailView.frame) + 30,recordButtonWidth , 30);
        
        _contrastButton.tag = 6;
        
      //  _contrastButton.backgroundColor = [UIColor yellowColor];

        [_contrastButton setTitle:@"+加入对比" forState:UIControlStateNormal];
        
        [_contrastButton setTitleColor:[UIColor colorWithRed:154 / 255.0 green:97 / 255.0 blue:101 / 255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_contrastButton];

        
        for (NSInteger a = 0; a < 2; a ++) {
            
            CALayer *layerRecordButton = [CALayer layer];
            
            layerRecordButton.cornerRadius = 5;
            
            layerRecordButton.borderColor = [[UIColor colorWithRed:154 / 255.0 green:97 / 255.0 blue:101/255.0 alpha:1] CGColor];
            
            layerRecordButton.borderWidth = 1;
            
            layerRecordButton.frame = CGRectMake(CGRectGetMinX(_detailView.frame)+ 5 + a * (recordButtonWidth + 15), CGRectGetMaxY(_detailView.frame) + 30 ,(recordButtonWidth) , 30);
            
            [self.contentView.layer addSublayer:layerRecordButton];

        }
        
           }
   
    return self;
}

#pragma mark--calorieButtonClick
- (void)calorieButtonClick:(UIButton *)sender
{
    if (sender.tag == 1) {
        
        _label.frame = CGRectMake( 260, 70, 30, 3);
    }else
    {
        _label.frame = CGRectMake( 300, 70, 30, 3);
    }
    
}


@end
