//
//  GoEatViewController.m
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "GoEatViewController.h"
#import "HomePageCollectionViewCell.h"
#import "EvalutionTableViewCell.h"
#import "NetWorkRequest.h"
#import "FirstModel.h"
#import "UIImageView+WebCache.h"
#import <SVPullToRefresh.h>
#import "EvalutionModel.h"
#import "KnoTableViewCell.h"
#import "KnoModel.h"
#import "KnoTableViewCelltwo.h"
#import "photoViewController.h"

@interface GoEatViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    UIView * buttonView;
    NSInteger ABC;
    NSArray * buttonTitleArray;
    UIScrollView * _scrollView;
    NSArray * colorArray;
    UIButton * _button;
    UIButton * jiluButton;
  
    UICollectionView * _collectionView;
    UITableView * evalutiontableview;
    UITableView * knoTableView;
    
    
    NSMutableArray * modelArray;
    NSMutableArray * evaArray;
    NSMutableArray * knoArray;
    
    NSInteger _page;
}
@end

@implementation GoEatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    knoArray=[[NSMutableArray alloc] init];
    evaArray=[[NSMutableArray alloc] init];
    modelArray=[[NSMutableArray alloc] init];
    buttonTitleArray=[[NSArray alloc] initWithObjects:@"首页",@"评测",@"知识",@"美食", nil];
    self.view.backgroundColor=[UIColor whiteColor];
    UIBarButtonItem * leftbutton=[[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(findClick)];
    self.navigationItem.leftBarButtonItem=leftbutton;
    [self createButton];
    [self createScrollview];
    [_collectionView triggerPullToRefresh];
    [evalutiontableview triggerPullToRefresh];
    [knoTableView triggerPullToRefresh];
    _page=1;
}

-(void)infinitethree
{
    
    [self requestKnoContentWith:++_page];
}
-(void)infinetetwo
{
    [self requestEvalutionContent:++_page];
}
-(void)infiniteone
{
    [self networkingrequest:++_page];
   
    
}
-(void)refreshthreee
{
    [knoArray removeAllObjects];
    [knoTableView reloadData];
    [self requestKnoContentWith:1];
}
-(void)refreshtwo
{
    [evaArray removeAllObjects];
    [evalutiontableview reloadData];
    [self requestEvalutionContent:1];
}
-(void)refreshone
{
      [modelArray removeAllObjects];
    
    [self networkingrequest:1];
  
}
#pragma mark--首页请求
-(void)networkingrequest:(NSInteger)page
{
  
    [NetWorkRequest requestFirstPageContentWithPage:page block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if (error)
        {
            NSLog(@"error=%@",error);
        }
        else
        {
//            NSData * data=[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//            NSString * string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",string);
            NSArray * feedsArray=responseObject[@"feeds"];
          
            for (NSDictionary * dic in feedsArray)
            {
                NSURL * avatar=dic[@"publisher_avatar"];
                NSString * title=dic[@"title"];
                NSString * publisher=dic[@"publisher"];
                NSURL * cardimage=dic[@"card_image"];
                NSInteger itemid=[dic[@"item_id"] integerValue];
                FirstModel * model=[[FirstModel alloc] init];
                model.itemID=itemid;
                model.avatar=avatar;
                model.title=title;
                model.publisher=publisher;
                model.cardImage=cardimage;
                [modelArray addObject:model];
            }
            
            [_collectionView reloadData];
            [_collectionView.pullToRefreshView stopAnimating];
            [_collectionView.infiniteScrollingView stopAnimating];
            
        }
        
    }];
}
#pragma mark--评测请求
-(void)requestEvalutionContent:(NSInteger)page
{
    [NetWorkRequest requestEvalutionContentWithPage:page block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if (error)
        {
            NSLog(@"%@",error);
        }
        else
        {
//            NSData * data=[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//                        NSString * string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",string);
            NSArray * feedsArray=responseObject[@"feeds"];
            for (NSDictionary * dic in feedsArray)
            {
                NSString * source=dic[@"source"];
                NSString * title=dic[@"title"];
                NSURL * background=dic[@"background"];
                NSString * tail=dic[@"tail"];
                EvalutionModel * model=[[EvalutionModel alloc] init];
                model.source=source;
                model.title=title;
                model.backGround=background;
                model.tail=tail;
                [evaArray addObject:model];
            }
            
            
            [evalutiontableview reloadData];
            [evalutiontableview.pullToRefreshView stopAnimating];
            [evalutiontableview.infiniteScrollingView stopAnimating];
        }
    }];
    
}
#pragma mark--知识请求
-(void)requestKnoContentWith:(NSInteger)page
{
    [NetWorkRequest requestKnoContentWithPage:page block:^(NSError * _Nullable error, id  _Nullable responseObject) {
        if (error)
        {
            NSLog(@"%@",error);
        }
        else
        {
            NSArray * feedsArray=responseObject[@"feeds"];
            for (NSDictionary * dic in feedsArray)
            {
                NSString * title=dic[@"title"];
                NSString * source=dic[@"source"];
                NSArray * images=dic[@"images"];
                NSInteger contenttype=[dic[@"content_type"] integerValue];
                NSString * tail=dic[@"tail"];
                KnoModel * model=[[KnoModel alloc] init];
                model.title=title;
                model.source=source;
                model.images=images;
                model.contentType=contenttype;
                model.tail=tail;
                [knoArray addObject:model];
            }
            
            [knoTableView reloadData];
            [knoTableView.pullToRefreshView stopAnimating];
            [knoTableView.infiniteScrollingView stopAnimating];
        }
        
        
    }];
    
}

#pragma mark--总体的Scrollview
-(void)createScrollview
{
    _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64+50, self.view.frame.size.width, 667-64-50)];
    _scrollView.backgroundColor=[UIColor whiteColor];
    for (int a=0; a<4; a++)
    {
        if (a==0)
        {
            [self createHomePageCollection];
        }
        else if (a==1)
        {
            [self createTablewView];
        }
        else if (a==2)
        {
            [self createKnoTableView];
        }
        
    }
    _scrollView.contentSize=CGSizeMake(self.view.frame.size.width*4, 667-114);
    _scrollView.pagingEnabled=YES;
    _scrollView.delegate=self;
    [self.view addSubview:_scrollView];
}

#pragma mark--UIScrollView的协议方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [jiluButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ABC=_scrollView.contentOffset.x/self.view.frame.size.width;
      _button=[buttonView viewWithTag:ABC+1];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    jiluButton=_button;
}

#pragma mark--首页
-(void)createHomePageCollection
{
    CGFloat space=10;
    UICollectionViewFlowLayout * layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize=CGSizeMake((_scrollView.frame.size.width-2*space)/2, 240);
    layout.sectionInset=UIEdgeInsetsMake(20, 5, 10, 5);
    layout.minimumLineSpacing=20;
     _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _scrollView.frame.size.height-50) collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    [_scrollView addSubview:_collectionView];
    [_collectionView registerClass:[HomePageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
   
    
    __weak GoEatViewController * weakself=self;
    [_collectionView addPullToRefreshWithActionHandler:^{
        [weakself refreshone];
    }];
    
    [_collectionView addInfiniteScrollingWithActionHandler:^{
        [weakself infiniteone];
    }];
    

    
    
}
#pragma mark--评测
-(void)createTablewView
{
     evalutiontableview=[[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width+20, 20, _scrollView.frame.size.width-40, _scrollView.frame.size.height-50)];
    evalutiontableview.tag=15;
    evalutiontableview.rowHeight=220;
    evalutiontableview.delegate=self;
    evalutiontableview.dataSource=self;
    [_scrollView addSubview:evalutiontableview];
    [evalutiontableview registerClass:[EvalutionTableViewCell class] forCellReuseIdentifier:@"evacell"];
    __weak GoEatViewController * weakself=self;
    [evalutiontableview addPullToRefreshWithActionHandler:^{
        [weakself refreshtwo];
    }];
    [evalutiontableview addInfiniteScrollingWithActionHandler:^{
        [weakself infinetetwo];
    }];
}
#pragma mark--知识
-(void)createKnoTableView
{
    knoTableView=[[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, 10, _scrollView.frame.size.width, _scrollView.frame.size.height-50)];
    knoTableView.tag=20;
    knoTableView.delegate=self;
    knoTableView.dataSource=self;
    knoTableView.rowHeight=140;
    [_scrollView addSubview:knoTableView];
    [knoTableView registerClass:[KnoTableViewCell class] forCellReuseIdentifier:@"knocell"];
    [knoTableView registerClass:[KnoTableViewCelltwo class] forCellReuseIdentifier:@"knocelltwo"];
    __weak GoEatViewController * weakself=self;
    [knoTableView addPullToRefreshWithActionHandler:^{
        [weakself refreshthreee];
    }];
    [knoTableView addInfiniteScrollingWithActionHandler:^{
        [weakself infinitethree];
    }];
}
#pragma mark--分类按钮
-(void)createButton
{
    CGFloat width=self.view.frame.size.width/4;
     buttonView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    for (int a=0; a<4; a++)
    {
       
       _button=[[UIButton alloc] initWithFrame:CGRectMake(a*width, 0, width, 50)];
        _button.tag=a+1;
        [_button setTitle:buttonTitleArray[a]  forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (_button.tag==1)
        {
            [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            jiluButton=_button;
        }
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonView addSubview:_button];
    }
    [self.view addSubview:buttonView];
    
    
}
-(void)buttonClick:(UIButton *)button
{
    [jiluButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    jiluButton=button;
    
    [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width*(button.tag-1), 0) animated:YES];
}
#pragma mark--左边搜索按钮
-(void)findClick
{
    
    
}
#pragma mark--UICollection的协议方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return modelArray.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    FirstModel * model=modelArray[indexPath.item];
    
    [cell.foodImageView sd_setImageWithURL:model.cardImage];
    
    cell.foodName.text=model.title;
    cell.foodMaster.text=model.publisher;
    [cell.heardImageView sd_setImageWithURL:model.avatar];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    photoViewController * photoVC=[[photoViewController alloc] init];
    photoVC.hidesBottomBarWhenPushed=YES;
    FirstModel * model=modelArray[indexPath.row];
    photoVC.model=model;
     
    [self.navigationController pushViewController:photoVC animated:YES];
}
#pragma mark--UITableView的协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    if (tableView.tag==15)
    {
        return  evaArray.count;
    }
    else
    {
        return  knoArray.count;
    }
   
   
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * acell=nil;
    if (tableView.tag==15)
    {
        EvalutionTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"evacell" forIndexPath:indexPath];
        if (cell==nil)
        {
            cell=[[EvalutionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"evacell"];
        }
        EvalutionModel * model=evaArray[indexPath.row];
        cell.source.text=model.source;
        [cell.evalutionImageView sd_setImageWithURL:model.backGround];
        cell.tail.text=model.tail;
        cell.evaTitle.text=model.title;

        acell=cell;
    }
    else if (tableView.tag==20)
    {
         KnoModel * model=knoArray[indexPath.row];
        if (model.contentType==1)
        {
              KnoTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"knocell" forIndexPath:indexPath];
            if (cell==nil) {
                cell=[[KnoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"knocell"];
            }
            cell.titleLabel.text=model.title;
            cell.sourceLabel.text=model.source;
            cell.tailLabel.text=model.tail;
             NSURL * url=model.images[0];
             [cell.images sd_setImageWithURL:url];
            acell=cell;
        }
        else if (model.contentType==2)
        {
            KnoTableViewCelltwo * cell=[tableView dequeueReusableCellWithIdentifier:@"knocelltwo" forIndexPath:indexPath];
            if (cell==nil)
            {
                cell=[[KnoTableViewCelltwo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"knocelltwo"];
            }
            cell.titleLabel.text=model.title;
            cell.sourceLabel.text=model.source;
            cell.tailLabel.text=model.tail;
            for (int a=0; a<3; a++)
            {
                UIImageView * imageview=[cell.view viewWithTag:a+1];
                [imageview sd_setImageWithURL:model.images[a]];
                
            }
            acell=cell;
            
        }
      
       
        }
    return acell;
}

@end
