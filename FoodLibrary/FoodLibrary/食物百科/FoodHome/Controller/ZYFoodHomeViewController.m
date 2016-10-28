//
//  FoodistaViewController.m
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYFoodHomeViewController.h"
#import "ZYSearchViewController.h"
#import "ZYFoodTableViewCell.h"
#import "NetWorkRequest.h"
#import "ZYGuide.h"
#import <UIImageView+WebCache.h>
#import "ZYFoodTypeViewController.h"

@interface ZYFoodHomeViewController ()<ZYSearchFieldDelegate,UITableViewDataSource,UITableViewDelegate,ZYGuiDeViewDelegate>
{
    NSArray *_titles;
    
    NSMutableArray *_classGuiDe;
    
    UITableView *_tableView;
}
@end

@implementation ZYFoodHomeViewController

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.hidesBottomBarWhenPushed=NO;
//}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _classGuiDe = [[NSMutableArray alloc] initWithCapacity:3];
    
    NSMutableArray *guiDes = [[NSMutableArray alloc] initWithCapacity:0];
    
    ZYGuide *guiDe = [[ZYGuide alloc] init];
    
    guiDe.name = @"食物对比";
    guiDe.detail = @"食物大PK";
    guiDe.imageURL = @"ic_account_boohee";
    
    [guiDes addObject:guiDe];
    
    [_classGuiDe addObject:guiDes];
    
    
    _titles = [[NSArray alloc] initWithObjects:@"",@"食物分类",@"热门品牌",@"连锁餐饮", nil];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
   ZYSearchField *SearchField = [[ZYSearchField alloc] init];
    
    SearchField.dateSource = self;
    
    SearchField.isSkip = NO;
    
    self.navigationItem.titleView =SearchField;
    
    [self scanButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 120) style:UITableViewStylePlain];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    _tableView.allowsSelection = NO;
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[ZYFoodTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self requestWithGuiDeData];
}

- (void)requestWithGuiDeData
{
    [NetWorkRequest requestGuideContent:@"http://food.boohee.com/fb/v1/categories/list" block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        NSArray *array = responseObject[@"group"];
        
       // NSLog(@"%ld",array.count);
        
        for (NSDictionary *dict in array) {
             NSMutableArray *guiDes = [[NSMutableArray alloc] initWithCapacity:0];
            NSArray *categories = dict[@"categories"];
            
           // NSLog(@"%ld",categories.count);
          
            for (NSDictionary *dic in categories) {
                
                 ZYGuide *guide = [[ZYGuide alloc] init];
                
                guide.name = dic[@"name"];
                
                guide.imageURL = dic[@"image_url"];
               
               // NSLog(@"guides--%ld",guiDes.count);
                [guiDes addObject:guide];
            }

            [_classGuiDe addObject:guiDes];
            [_tableView reloadData];

        }
        
        
    }];
    
}


#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     
    if (section == 0) {
        
        return 1;
    }else if (section == 1)
    {
        return 1;
    }else if (section == 2)
    {
        return 1;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.guiDeView.delegate = self;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat imageWidth = (width - 30 * 2 - 50 * 2) / 3;
    
    cell.foodLabel.text = nil;
    
    cell.PKLabel.text =nil;
    
    cell.imageViewHead.image = nil;
    
    cell.titleLabel.text = nil;
    
    cell.label.backgroundColor = [UIColor whiteColor];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
   cell.textLabel.highlightedTextColor = [UIColor redColor];
    
    if (_classGuiDe.count == 4) {
        
        NSArray *guiDeArray = _classGuiDe[indexPath.section];
        
        if (indexPath.section == 0) {
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            ZYGuide *guiDe = guiDeArray[0];
            
            cell.foodLabel.text = guiDe.name;
            
            cell.PKLabel.text = guiDe.detail;
            
            cell.imageViewHead.image = [UIImage imageNamed:guiDe.imageURL];
            
            cell.guiDeView.hidden= YES;
            
        }if (indexPath.section == 1) {
            
            cell.guiDeView.hidden= NO;
            
            cell.titleLabel.text = _titles[1];
            
            cell.label.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:37 / 255.0 blue:56 / 255.0 alpha:1];
            
            NSArray *guiDeArray = _classGuiDe[indexPath.section];
            
          CGRect frame = cell.guiDeView.backgroundView.frame;
            
            frame.size.height = 450;
            
            cell.guiDeView.backgroundView.frame =frame;
            
                for (NSInteger a = 0; a<guiDeArray.count; a ++) {
                    
                    ZYGuide *guiDe = guiDeArray[a];
                    
                    UIImageView *imageView = [cell.guiDeView.backgroundView viewWithTag:a + 1];
                    
                    imageView.frame =   (CGRectMake(a % 3 *(imageWidth + 50) + 40, a/3*(imageWidth + 40), imageWidth - 15 , imageWidth -15 ));
                    
                  //  imageView.backgroundColor = [UIColor redColor];
                    
                    NSURL *url = [[NSURL alloc] initWithString:guiDe.imageURL];
                    
                    [imageView sd_setImageWithURL:url];
                    
                    UILabel *label = [cell.guiDeView.backgroundView viewWithTag:a+ 20];
                    label.frame = CGRectMake(a % 3 * (imageWidth + 50)+8, a / 3 *(imageWidth + 40)+65, 120, 21);
                    
                    label.text = guiDe.name;
                   
        }
            
        }if (indexPath.section == 2) {
            
            cell.guiDeView.hidden = NO;
            
            CGRect frame = cell.guiDeView.backgroundView.frame;
            
            frame.size.height = 600;
            
            cell.guiDeView.backgroundView.frame = frame;
            
            frame = cell.guiDeView.frame;
            
            frame.size.height = 560;
            
            cell.guiDeView.frame = frame;
            
            cell.titleLabel.text = _titles[2];
            
            
            cell.label.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:37 / 255.0 blue:56 / 255.0 alpha:1];
            
            NSArray *guiDeArray = _classGuiDe[indexPath.section];
            
            for (NSInteger a = 0; a<guiDeArray.count; a ++) {
                
                ZYGuide *guiDe = guiDeArray[a];
                
                UIImageView *imageView = [cell.guiDeView.backgroundView viewWithTag:a + 1];
                
            //    imageView.backgroundColor = [UIColor redColor];
                
                 imageView.frame = (CGRectMake(a % 3 *(imageWidth + 50) + 30, a/3*(imageWidth + 40), imageWidth , imageWidth - 20));
               

                
                NSURL *url = [[NSURL alloc] initWithString:guiDe.imageURL];
                
                [imageView sd_setImageWithURL:url];
                
                UILabel *label = [cell.guiDeView.backgroundView viewWithTag:a+ 20];
                
                label.text = guiDe.name;
                
                 label.frame = (CGRectMake(a % 3 *(imageWidth + 50)+4, a/ 3 * (imageWidth + 40) + 60, 120 , 21));
            }
        }if (indexPath.section == 3) {
            
            cell.titleLabel.text = _titles[3];
            cell.label.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:37 / 255.0 blue:56 / 255.0 alpha:1];
            
            NSArray *guiDeArray = _classGuiDe[indexPath.section];
            
            for (NSInteger a = 0; a < guiDeArray.count; a ++) {
                
                CGRect frame = cell.guiDeView.backgroundView.frame;
                
                frame.size.height = 220;
                
                cell.guiDeView.backgroundView.frame = frame;
                
                 UIImageView *imageView = [cell.guiDeView.backgroundView viewWithTag:a + 1];
                
                
                    ZYGuide *guiDe = guiDeArray[a];
                    
                    imageView.hidden = NO;

                    
                    imageView.frame = (CGRectMake(a % 3 *(imageWidth + 50) + 30, a/3*(imageWidth + 40), imageWidth , imageWidth -20 ));
                    
                    
                    NSURL *url = [[NSURL alloc] initWithString:guiDe.imageURL];
                    
                    [imageView sd_setImageWithURL:url];
                    
                    UILabel *label = [cell.guiDeView.backgroundView viewWithTag:a + 20];
                    
                    label.text = guiDe.name;
                    
                    label.frame = (CGRectMake(a % 3 *(imageWidth + 50)+8, a/ 3 * (imageWidth + 40) + 65, 120 , 21));
              
                
                }
                
        }
        
}
    
    return cell;
}

#pragma mark--UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 0;
    }else if (section == 1)
    {
        return 15;
    }else if (section == 2)
    {
        return 15;
    }else
    {
        return 15;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 60;
    }else if (indexPath.section == 1){
        
        return 500;
    }else if (indexPath.section == 2){
        
        return 580;
    }else
    {
        return 230;
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
    
    viewHeader.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 /255.0 blue:244 / 255.0 alpha:1];
    
    return viewHeader;
}

- (void)scanButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 30, 30);
    
    [button setImage:[UIImage imageNamed:@"ic_addfood_scan"] forState:UIControlStateNormal];
     [button setImage:[UIImage imageNamed:@"ic_addfood_scan"] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark--ZYGuiDeViewDelegate
- (void)guiDeView:(ZYGuiDeView *)guiDeView didTapImageView:(UIImageView *)imageView
{
   UITableViewCell *cell = (UITableViewCell *)guiDeView.superview.superview;
    
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    
    if (indexPath.section == 1) {
        
        ZYFoodTypeViewController *foodDetailController =[[ZYFoodTypeViewController alloc] init];
        
        foodDetailController.value = imageView.tag;
        
        NSArray *array = _classGuiDe[1];
        
        ZYGuide *guiDe = array[imageView.tag - 1];
        
        foodDetailController.title = guiDe.name;
        
        foodDetailController.foodType = @"group";
        
        [foodDetailController setHidesBottomBarWhenPushed:YES];
        
        [self.navigationController pushViewController:foodDetailController animated:YES];
      
        
    }else if (indexPath.section ==2) {
        
        ZYFoodTypeViewController *foodDetailController =[[ZYFoodTypeViewController alloc] init];
        
        if (imageView.tag == 1) {
            
            foodDetailController.value = 20;
            
        }else if (imageView.tag == 12)
        {
            foodDetailController.value = 21;
            
        }else if (imageView.tag == 13){
            
            foodDetailController.value = 23;
        }else
        {
            foodDetailController.value = imageView.tag -1;
        }
        
        [foodDetailController setHidesBottomBarWhenPushed:YES];
        NSArray *array = _classGuiDe[2];
        
        ZYGuide *guiDe = array[imageView.tag - 1];
        
        foodDetailController.title = guiDe.name;
        
        foodDetailController.foodType = @"brand";
        
      
        
        [self.navigationController pushViewController:foodDetailController animated:YES];

    }else if(indexPath.section == 3)
    {
        ZYFoodTypeViewController *foodDetailController =[[ZYFoodTypeViewController alloc] init];
        
        foodDetailController.value = imageView.tag;
        
        NSArray *array = _classGuiDe[3];
        
        ZYGuide *guiDe = array[imageView.tag - 1];
        
        foodDetailController.title = guiDe.name;
        
        foodDetailController.foodType = @"restaurant";
        
        [foodDetailController setHidesBottomBarWhenPushed:YES];
        
        [self.navigationController pushViewController:foodDetailController animated:YES];
        
    }
}

#pragma mark--scanAction
- (void)scanAction
{
    
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"当前设备摄像功能不可用" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
    
    [alertView addAction:cancelAction];
    
    [self presentViewController:alertView animated:YES completion:nil];
     
}

- (void)skipInterface
{

   ZYSearchViewController *searchViewConroller = [[ZYSearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchViewConroller animated:YES];
}

@end
