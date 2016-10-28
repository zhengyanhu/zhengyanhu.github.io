//
//  FoodDetailViewController.m
//  FoodLibrary
//
//  Created by Mac on 16/8/3.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "NetWorkRequest.h"
#import "DetailModel.h"
#import "UIImageView+WebCache.h"
#import "FoodParatemerTableViewCell.h"
#import "FirstTableViewCell.h"
#import "FourthTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "MoreViewController.h"

@interface FoodDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
   
    NSArray * parameterArray;
   NSMutableArray * statusArray;
    NSMutableArray * numArray;
    NSMutableArray * remarkArray;
    
    NSArray * colorArray;
    UITableView * tableview;
    NSArray * titleArray;}

@end

@implementation FoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    numArray=[[NSMutableArray alloc] init];
    titleArray=[[NSArray alloc] initWithObjects:@"多吃",@"适吃",@"少吃", nil];
    [self networkRequest];
    colorArray=@[[UIColor greenColor],[UIColor yellowColor],[UIColor redColor]];
    parameterArray=[[NSArray alloc] initWithObjects:@"热量",@"蛋白质",@"脂肪",@"碳水化合物",@"膳食纤维", nil];
    statusArray=[[NSMutableArray alloc] initWithCapacity:1];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
  
    
}

#pragma mark--tableView的协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1)
    {
        return 30;
    }else
    {
        return 0;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==3)
    {
        NSString * string=[remarkArray lastObject];
        if ([string isEqualToString:@""])
        {
            return 0;
        }else
        {
            return 30;
        }
        
    }
    else
    {
    return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 150;
    }
    else if (indexPath.section==1)
    {
        return 50;
    }
    else if (indexPath.section==2)
    {
        NSString * string=[remarkArray lastObject];
        if ([string isEqualToString:@""])
        {
            return 0;
        }else
        {
            return 50;
        }
        
        
    }
    else if (indexPath.section==3)
    {
        return 120;
    }
    else
    {
        return 50;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else if(section==1)
    {
        return 6;
    }
    else if (section==2)
    {
        return 2;
        
    }
    else
    {
        return 1;
    }
  
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * acell=nil;
    DetailModel * model=statusArray[0];
    
    if (indexPath.section==0)
    {
        FirstTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"firstcell" forIndexPath:indexPath];
        [cell.heardImageview sd_setImageWithURL:[NSURL URLWithString:model.thumbImageUrl]];
        cell.nameLabel.text=model.name;
        cell.caLabel.text=[NSString stringWithFormat:@"%@千卡/每100克",model.calory];
        acell=cell;
    }
    else if (indexPath.section==1)
    {
        FoodParatemerTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"secondcell" forIndexPath:indexPath];
        if (indexPath.row==0)
        {
            cell.nameLabel.text=@"营养元素";
            cell.numLabel.text=@"每100克";
            cell.remarkLabel.text=@"备注";
            cell.remarkLabel.textColor=[UIColor blackColor];
        }
        else
        {
            cell.nameLabel.text=parameterArray[indexPath.row-1];
            cell.remarkLabel.text=remarkArray[indexPath.row-1];
            if (indexPath.row==1)
            {
                cell.numLabel.text=[NSString stringWithFormat:@"%@千卡",numArray[indexPath.row-1]];
            }
            else
            {
                cell.numLabel.text=[NSString stringWithFormat:@"%@克",numArray[indexPath.row-1]];
            }
            
        }
        acell=cell;
    }
    else if (indexPath.section==2)
    {
        ThirdTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"thirdcell" forIndexPath:indexPath];
        if ([model.gi isEqualToString:@""])
        {
            cell.GILabel.hidden=YES;
        }
        
        if (indexPath.row==0)
        {
            cell.GInum.text=model.gi;
            cell.GIheight.text=remarkArray[remarkArray.count-2];
            cell.GILabel.text=@"GI值";
        }else
        {
            cell.GInum.text=model.gl;
            cell.GIheight.text=remarkArray[remarkArray.count-1];
            cell.GILabel.text=@"GL值";
        }
        acell=cell;
    }
    else if (indexPath.section==3)
    {
        FourthTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"fourthcell" forIndexPath:indexPath];
        cell.lightLabel.text=@"食物推荐";
        cell.contentLabel.text=model.appraise;
        cell.lightView.backgroundColor=colorArray[model.healthLight-1];
        cell.eatLabel.text=titleArray[model.healthLight-1];
        cell.eatLabel.textColor=colorArray[model.healthLight-1];
        
        acell=cell;
    }
    else if (indexPath.section==4)
        
    {
        UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"fifthcell" forIndexPath:indexPath];
        
        acell=cell;
    }
    
    return acell;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==1)
    {
        UIView * view=[[UIView alloc]init];
        view.backgroundColor=[UIColor redColor];
        UIButton * button=[[UIButton alloc] initWithFrame:CGRectMake(20, 0, 300, 30)];
        button.backgroundColor=[UIColor whiteColor];
        [button setTitle:@"更多元素" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(moreSomething) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        return view;
    }
    else
    {
        return nil;
    }
    
}
#pragma mark--更多元素
-(void)moreSomething
{
    MoreViewController * VC=[[MoreViewController alloc] init];
    VC.model=statusArray[0];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark--网络请求
-(void)networkRequest
{
    [NetWorkRequest requestDetailContentWith:_foodcode block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if (error)
        {
            NSLog(@"%@",error);
        }
        else
        {
//            NSData * data=[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//            NSString * string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",string);
            [DetailModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{@"units":@"UnitsAddress"};
            }];
            
            
            [DetailModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{@"healthAppraise":@"Health_AppraiseAddress"};
            }];
             DetailModel * model=[DetailModel mj_objectWithKeyValues:responseObject];
            NSDictionary * dic=responseObject[@"lights"];
            remarkArray=[[NSMutableArray alloc] initWithObjects:dic[@"calory"],dic[@"protein"],dic[@"fat"],dic[@"carbohydrate"],dic[@"fiber_dietary"],dic[@"gi"],dic[@"gl"], nil];
            
            [numArray addObject:model.calory];
            [numArray addObject:model.protein];
            [numArray addObject:model.fat];
            [numArray addObject:model.carbohydrate];
            [numArray addObject:model.fiberDietary];
            [statusArray addObject:model];
            [self createTableView];
           
        }
        [tableview reloadData];
    }];
    
}
#pragma mark--tableview
-(void)createTableView
{
    tableview =[[UITableView alloc] initWithFrame:CGRectMake(0,64, 375, 567)];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    [tableview registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"firstcell"];
    [tableview registerClass:[FoodParatemerTableViewCell class] forCellReuseIdentifier:@"secondcell"];
    [tableview registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"thirdcell"];
    [tableview registerClass:[FourthTableViewCell class] forCellReuseIdentifier:@"fourthcell"];
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"fifthcell"];
    
    
}

#pragma mark--头View
-(void)createNameViewWith:(DetailModel*)model
{
   
    UIView * backgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 150)];
    backgroundView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:backgroundView];
    
    UIView * heardView=[[UIView alloc] initWithFrame:CGRectMake(20, -15, 375-40, 80)];
    heardView.backgroundColor=[UIColor redColor];
    [backgroundView addSubview:heardView];
    
    UIImageView * heardImageview=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    heardImageview.clipsToBounds=YES;
    heardImageview.layer.cornerRadius=25;
    [heardImageview sd_setImageWithURL:[NSURL URLWithString:model.thumbImageUrl]];
    [heardView addSubview:heardImageview];
    
    UILabel * nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(heardImageview.frame)+10, 10, 300, 20)];
    nameLabel.textColor=[UIColor blackColor];
    nameLabel.text=model.name;
    nameLabel.font=[UIFont systemFontOfSize:14];
    [heardView addSubview:nameLabel];
    
    
    UILabel * caLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(heardImageview.frame)+10, CGRectGetMaxY(nameLabel.frame)+5, 300, 30)];
    caLabel.font=[UIFont systemFontOfSize:20];
    NSString * string=[NSString stringWithFormat:@"%@千卡/每100克",model.calory];
    caLabel.text=string;
    [heardView addSubview:caLabel];
    
    
    
    
    
}


@end
