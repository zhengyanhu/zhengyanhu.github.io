//
//  photoViewController.m
//  FoodLibrary
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "photoViewController.h"
#import "UIImageView+WebCache.h"
#import "NetWorkRequest.h"
#import "PhotoModel.h"
#import "FoodDetailViewController.h"

@interface photoViewController ()
{
    NSString * _foodcode;
}
@property (weak, nonatomic) IBOutlet UIImageView *heardImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionlabel;

@property (weak, nonatomic) IBOutlet UIButton *sharedBtn;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;

@end

@implementation photoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [NetWorkRequest requestPhotoDetailWith:_model.itemID block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if (error)
        {
            NSLog(@"%@",error);
        }
        else
        {
             NSString * labeltext =responseObject[@"description"];
            if ([labeltext isKindOfClass:[NSString class]])
            {
                _descriptionlabel.text=labeltext;
            }
            else{
                _descriptionlabel.text=@"";
            }
            
           NSString * foodcode =responseObject[@"food_code"];
            if ([foodcode isKindOfClass:[NSString class]])
            {
                _foodcode=foodcode;

            }
            else
            {
                _foodcode=@"";
            }
            [self createTheButtonWith:_foodcode];
             NSString * dateString =responseObject[@"post_date"];
            [self changeDateFormatterWith:dateString];
        }
    }];
    
    [_heardImageView sd_setImageWithURL:_model.avatar];
    _heardImageView.clipsToBounds=YES;
    _heardImageView.layer.cornerRadius=20;
    _userName.text=_model.publisher;
    [_imageView sd_setImageWithURL:_model.cardImage];
   
}
#pragma mark--时间
-(void)changeDateFormatterWith:(NSString *)string
{
    NSString * record=[[NSString alloc] init];
    _time.text=[string componentsSeparatedByString:@"."][0];
    NSDate * date=[NSDate date];
    NSDateFormatter * formatter=[[NSDateFormatter alloc] init];
    formatter.dateFormat=@"yyyy-MM-ddEHH:mm:ss";
    
    date=[formatter dateFromString:_time.text];
    NSTimeInterval timeInter=[date timeIntervalSinceNow];
    NSInteger mm=-timeInter/60;
    NSInteger hh=-timeInter/60/60;
    
    formatter.dateFormat=@"HH";
    NSString * datestring=[formatter stringFromDate:[NSDate date]];
    
    NSInteger now=[datestring integerValue];
    if (hh<now)
    {
        if (mm<60)
        {
            record=[NSString stringWithFormat:@"%ld分钟前",(long)mm];
        }else
        {
            record=[NSString stringWithFormat:@"%ld小时前",(long)hh];
        }
    }
    else if (hh<now+24)
    
    {
        record=@"1天前";
    }else
    {
        formatter.dateFormat=@"MM月d日";
        record=[formatter stringFromDate:date];
    }
    _time.text=record;
}
#pragma mark--查看食物详情按钮是否存在
-(void)createTheButtonWith:(NSString*)string
{
    if ([string isEqualToString:@""])
    {
         _detailBtn.hidden=YES;
        CGRect frame=_sharedBtn.frame;
        frame.size.width=375;
        _sharedBtn.frame=frame;
        
    }
    else
    {
        _detailBtn.hidden=NO;
    }
    
    
    
}
#pragma mark--查看食物详情
- (IBAction)checkDetail:(id)sender {
    
    FoodDetailViewController * VC=[[FoodDetailViewController alloc] init];
    VC.foodcode=_foodcode;
    [self.navigationController pushViewController:VC animated:YES];
}

@end
