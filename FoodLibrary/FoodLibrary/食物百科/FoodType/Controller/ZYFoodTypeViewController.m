//
//  ZYFoodDetailViewController.m
//  FoodLibrary
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "ZYFoodTypeViewController.h"
#import "NetWorkRequest.h"
#import "ZYFoodTypeTableViewCell.h"
#import "ZYFood.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "ZYNurientUIScrollView.h"
#import <SVPullToRefresh.h>
#import "ZYDeatailFoodViewController.h"

@interface ZYFoodTypeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_foods;
    
    UITableView *_tableView;
    
    UIView *_backgroundView;
    
    ZYNurientUIScrollView *_nutrientScrollView;
    
      NSInteger _page;
}
@end

@implementation ZYFoodTypeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_tableView triggerPullToRefresh];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self customBarButton];
    
    _foods = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.title = self.titleNav;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 34, self.view.frame.size.width, self.view.frame.size.height - 34) style:UITableViewStylePlain];
    
   // _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _tableView.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1];
   
    //_tableView.allowsSelection = NO;
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
     _tableView.separatorInset = UIEdgeInsetsMake(0,55, 0, 0);
    
    _tableView.rowHeight = 55;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[ZYFoodTypeTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    __weak ZYFoodTypeViewController *weakSelf = self;
    
    [_tableView addInfiniteScrollingWithActionHandler:^{
        
        [weakSelf performSelectorInBackground:@selector(infinite) withObject:nil];
    }];
    
    [self backgroundView];
    
    _page = 1;
    
    [self requestClassFood:[NSNumber numberWithInteger:_page]];
    
}

- (void)customBarButton
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:@"ic_back_search"] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, 20, 30);
    
    [button addTarget:self action:@selector(popButton) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)backgroundView
{
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -1, self.view.frame.size.width,1)];
    
    _backgroundView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    
    _backgroundView.clipsToBounds = YES;
    
    
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    
    buttonView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:buttonView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.backgroundColor = [UIColor whiteColor];
    
    [button setImage:[UIImage imageNamed:@"ic_arrow_down_default"] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(10, 5, 69, 20);
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [button setTitle:@"常见" forState:UIControlStateNormal];
    
    button.imageEdgeInsets = UIEdgeInsetsMake(-2, 39, 0, 0);
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -45, 0, 0);
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonView addSubview:button];
    
    [self.view addSubview:_backgroundView];
    
    _nutrientScrollView = [[ZYNurientUIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    [_backgroundView addSubview:_nutrientScrollView];

}
#pragma mark--下拉刷新
- (void)infinite
{
    
    [self requestClassFood:[NSNumber numberWithInteger:_page]];
    
    _page++;
    //NSLog(@"%ld",_page);
    
}

- (void)requestClassFood:(NSNumber *)page
{
    [NetWorkRequest requestClassFoodValue:[NSNumber numberWithInteger:self.value] withKind:_foodType withPage:page block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        NSArray *foods = responseObject[@"foods"];
        
       // NSLog(@"%ld",foods.count);
        
        for (NSDictionary *dic in foods) {
            
            ZYFood *food = [ZYFood mj_objectWithKeyValues:dic];
            
            [_foods addObject:food];
            
            [food attributedText];
           // NSLog(@"===%@",food.healthLight);
        }
        
        [_tableView reloadData];
        
       
        [_tableView.infiniteScrollingView stopAnimating];
        
        
    }];
}

#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYFoodTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell.nameLabel.text = nil;
    
    //cell.detailLabel.text = nil;
    
    ZYFood *food = _foods[indexPath.row];
    
   // NSLog(@"%@",food.thumbImageUrl);
    
    if (food.thumbImageUrl!=nil) {
        
        NSURL *urlImage = [[NSURL alloc] initWithString:food.thumbImageUrl];
        [cell.foodImageView sd_setImageWithURL:urlImage];

    }

    cell.nameLabel.text = food.name;
    
    cell.detailLabel.attributedText = food.attributedCalory;
    
    
    cell.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1];
    
    NSInteger healthValue = [food.healthLight integerValue];
    
    switch (healthValue) {
        case 1:{
            
            cell.healthLable.backgroundColor = [UIColor greenColor];
           }
            break;
        case 2:{
            cell.healthLable.backgroundColor = [UIColor yellowColor];
            }
            break;
        case 3:{
            cell.healthLable.backgroundColor = [UIColor redColor];
        }
            break;
            
        default:
            break;
    }
    
   
    return cell;
}

#pragma mark--
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYDeatailFoodViewController *detaiFoodController = [[ZYDeatailFoodViewController alloc] init];
    
    ZYFood *food = _foods[indexPath.row];
    
    detaiFoodController.food = food;
    
    
    
    [self.navigationController pushViewController:detaiFoodController animated:YES];
    
}


#pragma mark--buttonClick
- (void)buttonClick:(UIButton *)sender
{
    sender.selected =!sender.selected;
    
    if (sender.selected) {
        
        [sender setImage:[UIImage imageNamed:@"ic_arrow_up_default"] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.35 animations:^{
            
            [_backgroundView bringSubviewToFront:self.view];
            _backgroundView.frame = CGRectMake(0, 94, self.view.frame.size.width, self.view.frame.size.height);
            
        }];

    }else
    {
        
        [sender setImage:[UIImage imageNamed:@"ic_arrow_down_default"] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.35 animations:^{
            
            [self.view bringSubviewToFront:_backgroundView];
            _backgroundView.frame = CGRectMake(0, -1, self.view.frame.size.width, 1);
            
            
        }];
    }
  }

#pragma mark--pop
- (void)popButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
