//
//  ZYfDeatailFoodViewController.m
//  FoodLibrary
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYDeatailFoodViewController.h"
#import "ZYDetailFoodTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "ZYFoodNutritionTableViewCell.h"
#import "NetWorkRequest.h"
#import <MJExtension.h>
#import "ZYNurientValue.h"
#import "ZYCoreFood.h"
#import "ZYMoreNutritionViewController.h"
#import "ZYHealthTableViewCell.h"

@interface ZYDeatailFoodViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    
    ZYNurientValue *_nurient;
    UITableView *_tableView;
    NSMutableArray *_items;
    NSArray *_titles;
    
    
}

@end

@implementation ZYDeatailFoodViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _titles = [[NSArray alloc] initWithObjects:@"营养元素",@"热量",@"蛋白质",@"脂肪",@"碳水化合物", nil];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = self.food.name;
    
    self.navigationItem.leftBarButtonItem = [self backBarButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableView.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.clipsToBounds = NO;
    
    _tableView.allowsSelection = NO;
    
    [self.view addSubview:_tableView];
    
    
    [_tableView registerClass:[ZYDetailFoodTableViewCell class]
      forCellReuseIdentifier:@"cell"];
    
    [_tableView registerClass:[ZYFoodNutritionTableViewCell class] forCellReuseIdentifier:@"cell1"];
    
    [_tableView registerClass:[ZYHealthTableViewCell class] forCellReuseIdentifier:@"cell2"];
    
    [self.food attributedTextDetailLabel];
    
    [self requestIfood];
    

}

- (void)requestIfood
{
        
  [NetWorkRequest requestIFoodWithCode:self.food.code block:^(NSError * _Nullable error, id  _Nullable responseObject) {
            
            // NSLog(@"%@",responseObject);
            
            [ZYNurientValue mj_setupObjectClassInArray:^NSDictionary *{
                
                return @{@"units":@"ZYUnits"};
            }];
            
            _nurient = [ZYNurientValue mj_objectWithKeyValues:responseObject];
      
          
            _items = [[NSMutableArray alloc] initWithCapacity:0];
            
            for (NSInteger a = 0; a < _nurient.units.count ; a ++) {
                
                ZYUnits *units = _nurient.units[a];
                
                
                
                NSString *hundred = nil;
                
                if (_items.count == 0) {
                    
                    hundred = [NSString stringWithFormat:@"每100%@",units.unitName];
                    //   NSLog(@"%@",hundred);
                }
                else
                {
                    hundred = [NSString stringWithFormat:@"每1.0%@",units.unitName];
                    // NSLog(@"%@",hundred);
                }
                
                [_items addObject:hundred];
                
                
                
                [_tableView reloadData];

            }
            
  }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
    }else if(section ==1){
        
        return 1;
    }else{
        return 1;
    }
//    else if (section == 2){
//        
//        return 1;
//    }else
//    {
//      return 1;
//    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//       UITableViewCell *tableViewCell  = nil;
    
        if (indexPath.section == 0) {
    
      ZYDetailFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
             
             
              cell.detailView.hidden = NO;
              cell.recordButton.hidden = NO;
              cell.detailView.backgroundColor = [UIColor whiteColor];
              
              [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:self.food.thumbImageUrl]];
              
              cell.nameLabel.text = self.food.name;
              
              cell.detailLabel.attributedText = self.food.attributedCaloryDetail;

        
//             tableViewCell = cell;
            return cell;
                 }
         else if(indexPath.section == 1){
          
      ZYFoodNutritionTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
              
        UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:_items];
              
              segmented.frame = CGRectMake(15, 15, self.view.frame.size.width - 30, 30);
              
              [segmented setTintColor:[UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1]];
              NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor redColor]};
              [segmented setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
              
             segmented.selectedSegmentIndex = 0;
              
              [cell1.contentView addSubview:segmented];
             
             
             cell1.nurtitionView.backgroundColor = [UIColor whiteColor];
             
             for (NSInteger a = 0; a < _titles.count; a ++) {
                 
                 UILabel *labelTitle  = [cell1.nurtitionView viewWithTag:a + 1];
                 
                 if (labelTitle.tag == 1) {
                     
                     labelTitle.font = [UIFont systemFontOfSize:12];
                     labelTitle.textColor = [UIColor lightGrayColor];
                 }
                 
                 labelTitle.text = _titles[a];
                 
             }
             for (NSInteger a = 0; a < _titles.count; a++) {
                 
                 UILabel *labelNutrition = [cell1.nurtitionView viewWithTag:a + 10];
                 
                 if (labelNutrition.tag == 10) {
                     
                     labelNutrition.textColor = [UIColor lightGrayColor];
                     labelNutrition.text = @"每100克";
                     labelNutrition.font = [UIFont systemFontOfSize:12];
                 }else if (labelNutrition.tag == 11){
                     
                     labelNutrition.text = [NSString stringWithFormat:@"%@千卡",_nurient.calory];
                 }else if (labelNutrition.tag == 12){
                     
                     labelNutrition.text = [NSString stringWithFormat:@"%@克",_nurient.protein];
                 }else if (labelNutrition.tag == 13){
                     
                     labelNutrition.text = [NSString stringWithFormat:@"%@克",_nurient.fat];
                 }else{
                     
                     labelNutrition.text =[NSString stringWithFormat:@"%@克",_nurient.carbohydrate];;
                 }
                 
                 
             }
             for (NSInteger a = 0; a < _titles.count; a++) {
                 
                 UILabel *labelNutrition = [cell1.nurtitionView viewWithTag:a + 20];
                 
                 if (labelNutrition.tag == 20) {
                     
                     labelNutrition.textColor = [UIColor lightGrayColor];
                     labelNutrition.text = @"备注";
                     labelNutrition.font = [UIFont systemFontOfSize:12];
                 }else if (labelNutrition.tag == 21){
                     
                     labelNutrition.text =  _nurient.caloryStarTag;
                 }else if (labelNutrition.tag == 22){
                     
                     labelNutrition.text = @"";
                 }else if (labelNutrition.tag == 23){
                     
                 NSString *satietyStarTag = [ _nurient.satietyStarTag substringFromIndex:19];
                     
                     
                     labelNutrition.text = satietyStarTag ;
                 }
                 
             }

             [cell1.buttonMore addTarget:self action:@selector(skipMoreNutritionButton) forControlEvents:UIControlEventTouchUpInside];
             
//              tableViewCell = cell1;
             return cell1;
          
         }else{
             
             ZYHealthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
             cell.healthColor.backgroundColor = [UIColor redColor];
             
             cell.healthConsult.text = @"123123123";
              
              return cell;
         }
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 150;
    }else
    {
        
        return 230;
    }
//    else if (indexPath.section ==2){
//        
//        return 200;
//    }else
//    {
//        return 100;
//    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1;
        
    }else
    {
        
        return 10;
    }
//    else if (section == 2){
//        
//        return 10;
//    }else
//    {
//       return 10;
//    }
}



- (UIBarButtonItem *)backBarButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:@"ic_back_search"] forState:UIControlStateNormal];
 
    button.frame = CGRectMake(0, 0, 20, 30);
    
    [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButton;
}

#pragma mark--pop
- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark--skipMoreNutritionButton
- (void)skipMoreNutritionButton
{
    ZYMoreNutritionViewController *moreNutritionController = [[ZYMoreNutritionViewController alloc] init];
    moreNutritionController.coreFood = _nurient.coreFood;
    
    
    [self.navigationController pushViewController:moreNutritionController animated:YES];
    
    
}



@end
