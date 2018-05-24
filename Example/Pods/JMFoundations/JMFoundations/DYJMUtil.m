//
//  DYJMUtil.m
//  IntelligentInvestmentAdviser
//
//  Created by 宋骁俊 on 2018/5/15.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "DYJMUtil.h"

//-----------------string----------------
#pragma mark - string

/*
 nil或非字符串对象转""
 */
FOUNDATION_EXPORT NSString * DY_NilToEmptyString(id obj){
   return DY_NilToDefultString(obj,@"");
}

/*
 nil或非字符串对象转defult
 */
FOUNDATION_EXPORT NSString * DY_NilToDefultString(id obj,NSString *defult){
    return ((obj && [obj isKindOfClass:[NSString class]] && [obj length]>0) ? (obj) : defult);
}





//-----------------jsonObject--------------
#pragma mark - jsonObject

/*
 返回是否NULL对象
 */
FOUNDATION_EXPORT BOOL DY_IsKindOfNullClass(id obj){
    return (obj && [obj isKindOfClass:[NSNull class]]);
}

/*
 NULL对象转nil
 */
FOUNDATION_EXPORT id DY_NullToNil(id obj){
    return ((obj && [obj isKindOfClass:[NSNull class]])?nil : (obj));
}

/*
 获取JSON对象的值
 */
FOUNDATION_EXPORT id DY_JsonGet(id obj,NSString *keys,id defult){
    id result = DY_NullToNil(obj);
    
    NSArray *tmpKey = [keys componentsSeparatedByString:@","];
    for(int i=0;i<tmpKey.count;i++){
        //字典类型
        if(DY_IsKindOfDictionaryClass(result)){
            result = [result objectForKey:tmpKey[i]];
        }
        //数组类型
        else if(DY_IsKindOfArrayClass(result)){
            NSArray *tmpArr = result;
            NSString *str = tmpKey[i];
            NSInteger index = [str integerValue];
            //不是数字或者越界
            if((index == 0 && ![@"0" isEqualToString:str]) || tmpArr.count<=index){
                result = nil;
            }
            else{
                result = [tmpArr objectAtIndex:index];
            }
        }
        else{
            result = nil;
        }
        
        if(!DY_NullToNil(result)){
            break;
        }
    }
    result = DY_NullToNil(result);
    
    
    if(!result && defult){
        result = defult;
    }
    return result;
}



//------------------array----------------
#pragma mark - array

/*
 返回是否数组类型
 */
FOUNDATION_EXPORT BOOL DY_IsKindOfArrayClass(id obj){
    return (obj && [obj isKindOfClass:[NSArray class]]);
}

/*
 非NSArray对象转nil
 */
FOUNDATION_EXPORT NSArray* DY_NULLToNilArray(id obj){
    return ((obj && [obj isKindOfClass:[NSArray class]])?(obj) : nil);
}

/*
 返回符合条件的第一个对象index,没有返回-1
 */
FOUNDATION_EXPORT NSInteger DY_ArrFindIndex(NSArray *arr, BOOL (^check)(id item)){
    if(check){
        for(NSInteger i = 0;i<arr.count;i++){
            id item = arr[i];
            if(check(item)){
                return i;
            }
        }
    }
    return -1;
}

/*
 返回符合条件的第一个对象，没有返回nil
 */
FOUNDATION_EXPORT id DY_ArrFind(NSArray *arr, BOOL (^check)(id item)){
    if(check){
        for(NSInteger i = 0;i<arr.count;i++){
            id item = arr[i];
            if(check(item)){
                return item;
            }
        }
    }
    return nil;
}

/*
 返回符合条件的所有对象index数组
 */
FOUNDATION_EXPORT NSArray <NSNumber *>* DY_ArrFindAllIndex(NSArray *arr, BOOL (^check)(id item)){
    NSMutableArray *tmp = [NSMutableArray new];
    if(check){
        for(NSInteger i = 0;i<arr.count;i++){
            id item = arr[i];
            if(check(item)){
                [tmp addObject:@(i)];
            }
        }
    }
    if(tmp.count>0){
        return tmp;
    }
    else{
        return nil;
    }
}

/*
 返回符合条件的所有对象
 */
FOUNDATION_EXPORT NSArray * ArrFindAll(NSArray *arr, BOOL (^check)(id item)){
    NSMutableArray *tmp = [NSMutableArray new];
    if(check){
        for(NSInteger i = 0;i<arr.count;i++){
            id item = arr[i];
            if(check(item)){
                [tmp addObject:item];
            }
        }
    }
    if(tmp.count>0){
        return tmp;
    }
    else{
        return nil;
    }
}

/*
 数组转换map方法
 */
FOUNDATION_EXPORT NSMutableArray * DY_ArrMap(NSArray *arr, id (^newItemBlock)(id item)){
    if(newItemBlock){
        NSMutableArray *tmp = [NSMutableArray new];
        for(NSInteger i = 0;i<arr.count;i++){
            id item = arr[i];
            [tmp addObject:newItemBlock(item)];
        }
        return tmp;
    }
    else{
        return [NSMutableArray arrayWithArray:arr];
    }
}


//---------------------dictionary-------------------
#pragma mark - dictionary


/*
 返回是否字典类型
 */
FOUNDATION_EXPORT BOOL DY_IsKindOfDictionaryClass(id obj){
    return (obj && [obj isKindOfClass:[NSDictionary class]]);
}

/*
 非NSDictionary对象转nil
 */
FOUNDATION_EXPORT NSDictionary* DY_NULLToNilDictionary(id obj){
    return ((obj && [obj isKindOfClass:[NSDictionary class]])?(obj) : nil);
}


//-----------------number----------------
#pragma mark - number

/*
 返回number数组的基本操作
 */
FOUNDATION_EXPORT NSNumber * DY_NumberArrFoundation(NSArray <NSNumber *>* arr,NSString* type){
    //最大
    if([@"max" isEqualToString:type]){
        return [arr valueForKeyPath:@"@max.floatValue"];
    }
    //最小
    else if([@"min" isEqualToString:type]){
        return [arr valueForKeyPath:@"@min.floatValue"];
    }
    //平均
    else if([@"avg" isEqualToString:type]){
        return [arr valueForKeyPath:@"@avg.floatValue"];
    }
    //求和
    else if([@"sum" isEqualToString:type]){
        return [arr valueForKeyPath:@"@sum.floatValue"];
    }
    //总体标准差
    else if([@"stdDev" isEqualToString:type]){
        CGFloat dev = 0.0;
        if(arr.count>0){
            CGFloat ma = [[arr valueForKeyPath:@"@avg.floatValue"] floatValue];
            for(NSInteger i = 0;i<arr.count;i++){
                CGFloat square = ([arr[i] floatValue] - ma) * ([arr[i] floatValue] - ma);
                dev += square;
            }
            dev = sqrt(dev/arr.count);
        }
        return @(dev);
    }
    else{
        return nil;
    }
    
    
    
}




@implementation DYJMUtil


@end
