//
//  DYTimer.h
//  YiChuangDemo
//
//  Created by 宋骁俊 on 2018/5/14.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum{
    DYTimer_StateType_defult = 0,  //默认状态
    DYTimer_StateType_resume = 1,  //执行
    DYTimer_StateType_suspend = 2, //挂起
    
} DYTimer_StateTypes;

@interface DYTimer : NSObject

/*
 创建timer
 start:x秒后开始调用
 interval:间隔重复调用
 handler:回调方法
 */
-(instancetype)initWithStart:(CGFloat)start interval:(CGFloat)interval handler:(dispatch_block_t)handler;

//开始计时器
-(void)resumeTimer;

//挂起计时器
-(void)suspendTimer;

@end
