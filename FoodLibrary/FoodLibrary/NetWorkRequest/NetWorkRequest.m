//
//  NetWorkRequest.m
//  FoodLibrary
//
//  Created by Mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "NetWorkRequest.h"
#import <AFNetworking.h>
#import "ZYHttpConst.h"
@implementation NetWorkRequest
+(void)requestFirstPageContentWithPage:(NSInteger)page block:(blocker)complete
{
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    NSString * urlString=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/feeds/combined?page=%@&category=1&per=10&app_device=Android&app_version=2.3&channel=tencent&user_key=&token=&phone_model=HM+NOTE+1S&os_version=4.4.4",@(page)];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(error,nil);
    }];
    
    
}

+(void)requestEvalutionContentWithPage:(NSInteger)page block:(blocker)complete
{
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    NSString * urlstring=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/feeds/combined?page=%@&category=2&per=10&app_device=Android&app_version=2.3&channel=tencent&user_key=&token=&phone_model=HM+NOTE+1S&os_version=4.4.4",@(page)];
    [manager GET:urlstring parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(error,nil);
    }];
    
    
}
+(void)requestKnoContentWithPage:(NSInteger)page block:(blocker)complete
{
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    NSString * urlString=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/feeds/combined?page=%@&category=3&per=10&app_device=Android&app_version=2.3&channel=tencent&user_key=&token=&phone_model=HM+NOTE+1S&os_version=4.4.4",@(page)];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(error,nil);
    }];
    
}
+(void)requestPhotoDetailWith:(NSInteger)itemId block:(blocker)complete
{
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    NSString * urlstring=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/food_cards/%ld?app_device=Android&app_version=2.3&channel=tencent&user_key=&token=&phone_model=HM+NOTE+1S&os_version=4.4.4",(long)itemId];
    [manager GET:urlstring parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(error,nil);
}];

}

+(void)requestDetailContentWith:(NSString*)foodcode block:(blocker)complete
{
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    NSString * urlstring=[NSString stringWithFormat:@"http://food.boohee.com/fb/v1/foods/%@/mode_show?app_device=Android&app_version=2.3&channel=tencent&user_key=&token=&phone_model=HM+NOTE+1S&os_version=4.4.4",foodcode];
    [manager GET:urlstring parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(error,nil);
    }];
    
    
}

////////////////
+(void)requestGuideContent:(NSString *)url block:(blocker)complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(nil,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
    
}


+ (void)requestClassFoodValue:(NSNumber *)value withKind:(NSString *)kind withPage:(NSNumber *)page block:(blocker)complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *get =[NSString stringWithFormat:@"%@?value=%@&order_by=1&kind=%@&order_asc=0&page=%@",ZYHost,value,kind,page] ;
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:get parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
       // NSLog(@"%@",result);
        
        complete(nil,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}

+(void)requestIFoodWithCode:(NSString *)code block:(blocker)complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@",ZYHost2,code,ZYToken];
    
      //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//         NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"%@",result);
                 
        complete(nil,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}


@end
