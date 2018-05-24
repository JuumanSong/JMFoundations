//
//  ViewController.m
//  JMFoundationDemo
//
//  Created by 宋骁俊 on 2018/5/24.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "ViewController.h"
#import  <JMFoundations/DYJMUtil.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{
                          @"a":@"string",
                          @"b":@{@"b1":@{@"b2":@"b2str"}},
                          @"c":@[@"123",@{@"bs1":@345},@[@"bs2",@"hhs"]],
                          @"d":[NSNull new],
                          };
    
    id a = DY_JsonGet(dic, @"b,b1", @"defult1");
    id b = DY_JsonGet(dic, @"b,b1,b3", @"defult2");
    id c = DY_JsonGet(dic, @"c,4,bs1", @"defult3");
    id d = DY_JsonGet(dic, @"c,2,0", @"defult4");
    id e = DY_JsonGet(dic, @"d", @"defult5");
    
    NSLog(@"\n a = %@ \n b = %@ \n c = %@ \n d = %@ \n e = %@",a,b,c,d,e);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
