//
//  DYTimer.m
//  YiChuangDemo
//
//  Created by 宋骁俊 on 2018/5/14.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "DYTimer.h"

@interface DYTimer(){
    dispatch_source_t _timer;
}

@property(nonatomic)DYTimer_StateTypes state;

@end


@implementation DYTimer

-(instancetype)initWithStart:(CGFloat)start interval:(CGFloat)interval handler:(dispatch_block_t)handler{
    self = [super init];
    if(self){
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        //开始时间
        dispatch_time_t t_start = dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC);
        //间隔时间
        uint64_t t_interval = interval * NSEC_PER_SEC;
        dispatch_source_set_timer(_timer, t_start, t_interval, 0 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(_timer , ^{
            if(handler){
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler();
                });
            }
        });
        self.state = DYTimer_StateType_defult;
    }
    return self;
}

-(void)resumeTimer{
    if(self.state != DYTimer_StateType_resume){
        if(_timer){
            dispatch_resume(_timer);
        }
        self.state = DYTimer_StateType_resume;
    }
}

-(void)suspendTimer{
    if(self.state == DYTimer_StateType_resume){
        if(_timer){
            dispatch_suspend(_timer);
        }
        self.state = DYTimer_StateType_suspend;
    }
}

-(void)dealloc{
    //当timer被挂起时，无法释放，只能再重启一次
    if(self.state == DYTimer_StateType_suspend){
        [self resumeTimer];
    }
}

@end
