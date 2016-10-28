//
//  ZYMoreNutritionViewController.m
//  FoodLibrary
//
//  Created by mac on 16/8/6.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYMoreNutritionViewController.h"

@interface ZYMoreNutritionViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_nutritions;
}
@end

@implementation ZYMoreNutritionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titles = [[NSArray alloc] initWithObjects:@"营养元素",@"每100克",@"备注", nil];
    
    _nutritions = @[@"热量",@"蛋白质",@"脂肪",@"碳水化合物",@"膳食纤维",@"维生素A",@"维生素C",@"维生素E",@"胡萝卜素",@"维生素B1(硫胺素)",@"维生素B2(核黄素)",@"烟酸",@"胆固醇",@"镁",@"钙",@"铁",@"锌",@"铜",@"锰",@"钾",@"磷",@"钠",@"硒",];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-30)];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    tableView.rowHeight = 40;
    
    [self.view addSubview:tableView];
    
    
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    titleView.backgroundColor = [UIColor lightGrayColor];
    
    for (NSInteger a = 0; a < 3; a ++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20 + (a * (100 + 55)) , 0, 100, 30)];
        
        label.textAlignment = NSTextAlignmentLeft;
        
       // label.backgroundColor = [UIColor redColor];
        
        label.font = [UIFont systemFontOfSize:12];
        
        label.textColor = [UIColor grayColor];
        
        label.text = titles[a];
        
        [titleView addSubview:label];
        
    }
    [self.view addSubview:titleView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nutritions.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 105, 20)];
        label.tag = 1;

        label.font = [UIFont systemFontOfSize:12];
        
        label.textColor = [UIColor blackColor];
        
        [cell.contentView addSubview:label];
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(165, 20, 100, 20)];
        
        
        label1.font = [UIFont systemFontOfSize:12];
        
        label1.textColor = [UIColor blackColor];
        
        label1.tag = 10;
        
        [cell.contentView addSubview:label1];
        
        

        
       
    }
    
    UILabel *label = [cell.contentView viewWithTag:1];
    
    if (label.tag == 1) {
        
        label.text = _nutritions[indexPath.row];

    }
    
    
  nil;
    for (NSInteger a = 0; a < _nutritions.count; a ++) {
    
        UILabel *label1 = [cell.contentView  viewWithTag:10];
        
        
        NSString * result = nil;
        
        NSString *string = nil;
        
        
        switch (indexPath.row) {
            case 0:{
                
                string = [NSString stringWithFormat:@"%@千卡",self.coreFood.calory];
                
                result =  self.coreFood.calory ==nil?@"--":string;
                
                label1.text = result;
                
               // NSLog(@"%@",result);
            }
                break;
            case 1:{
                string = [NSString stringWithFormat:@"%@克",self.coreFood.protein];
                
                result =  self.coreFood.protein ==nil?@"--":string;
                
                label1.text = result;
               // NSLog(@"%@",result);
            }
                break;
            case 2:{
                string = [NSString stringWithFormat:@"%@克",self.coreFood.fat];
                
                result =  self.coreFood.fat ==nil?@"--":string;
                
                label1.text = result;
                //NSLog(@"%@",result);
            }
                break;
            case 3:{
                string = [NSString stringWithFormat:@"%@克",self.coreFood.carbohydrate];
                
                result =  self.coreFood.carbohydrate ==nil?@"--":string;
                
                label1.text = result;
            }
                break;
            case 4:{
                string = [NSString stringWithFormat:@"%@克",self.coreFood.fiberDietary];
                
                result =  self.coreFood.fiberDietary ==nil?@"--":string;
                
                label1.text = result;
            }
                break;
            case 5:{
                string = [NSString stringWithFormat:@"%@IU",self.coreFood.vitaminA];
                
                result =  self.coreFood.vitaminA ==nil?@"--":string;
                
                label1.text = result;
            }
                break;
            case 6:{
                
                string =  [NSString stringWithFormat:@"%@毫克",self.coreFood.vitaminC];
                
                result = self.coreFood.vitaminC ==nil?@"--":string;
                
                label1.text = result;
            }
                break;
            case 7:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.vitaminE];
                
                label1.text = self.coreFood.vitaminE == nil?@"--":string;
            }
                break;
            case 8:{
                
                string = [NSString stringWithFormat:@"%@微克",self.coreFood.carotene];
                label1.text = self.coreFood.carotene == nil?@"--":string;
            }
                break;
            case 9:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.thiamine];
                label1.text = self.coreFood.thiamine == nil?@"--":string;
            }
                break;
            case 10:{
                
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.lactoflavin];
                label1.text = self.coreFood.lactoflavin == nil?@"--":string;
            }
                break;
            case 11:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.niacin];
                label1.text =self.coreFood.niacin == nil?@"--":string;
            }
                break;
            case 12:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.cholesterol];
                label1.text = self.coreFood.cholesterol == nil?@"--":string;
            }
                break;
            case 13:{
                
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.magnesium];
                label1.text = self.coreFood.magnesium == nil?@"--":string;
            }
                break;
                
            case 14:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.calcium];
                label1.text = self.coreFood.calcium == nil?@"--":string;
            }
                break;
            case 15:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.iron];
                label1.text =self.coreFood.iron == nil?@"--":string;
            }
                break;
            case 16:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.zinc];
                label1.text = self.coreFood.zinc == nil?@"--":string;
            }
                break;
            case 17:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.copper];
                label1.text =self.coreFood.copper == nil?@"--":string;
            }
                break;
            case 18:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.manganese];
                label1.text =self.coreFood.manganese == nil?@"--":string;
            }
                break;
            case 19:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.kalium];
                label1.text = self.coreFood.kalium == nil?@"--":string;
            }
                break;
            case 20:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.phosphor];
                label1.text =self.coreFood.phosphor == nil?@"--":string;
            }
                break;
            case 21:{
                string = [NSString stringWithFormat:@"%@毫克",self.coreFood.natrium];
                label1.text = self.coreFood.natrium == nil?@"--":string;
            }
                break;
            case 22:{
               string = [NSString stringWithFormat:@"%@微克",self.coreFood.selenium];
                label1.text =self.coreFood.selenium == nil?@"--":string;
            }
                break;
                
            default:
                break;
        }

        
        
   }
    
    
   
  
    
    return cell;
    
}



@end
