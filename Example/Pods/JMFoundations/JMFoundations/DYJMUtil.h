//
//  DYJMUtil.h
//  IntelligentInvestmentAdviser
//
//  Created by 宋骁俊 on 2018/5/15.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//-----------------string----------------
#pragma mark - string

/*
 nil或非字符串对象转""
 */
FOUNDATION_EXPORT NSString * DY_NilToEmptyString(id obj);

/*
 nil或非字符串对象转defult
 */
FOUNDATION_EXPORT NSString * DY_NilToDefultString(id obj,NSString *defult);

//-----------------jsonObject--------------
#pragma mark - jsonObject

/*
 返回是否NULL对象
 */
FOUNDATION_EXPORT BOOL DY_IsKindOfNullClass(id obj);

/*
 NULL对象转nil
 */
FOUNDATION_EXPORT id DY_NullToNil(id obj);

/*
 获取JSON对象的值
 obj:{a:{b:["c","d"]}}
 keys:"a,b,1"
 defult:nil
 */
FOUNDATION_EXPORT id DY_JsonGet(id obj,NSString *keys,id defult);




//------------------array----------------
#pragma mark - array

/*
 返回是否数组类型
 */
FOUNDATION_EXPORT BOOL DY_IsKindOfArrayClass(id obj);

/*
 非NSArray对象转nil
 */
FOUNDATION_EXPORT NSArray* DY_NULLToNilArray(id obj);

/*
 返回符合条件的第一个对象index,没有返回-1
 */
FOUNDATION_EXPORT NSInteger DY_ArrFindIndex(NSArray *arr, BOOL (^check)(id item));

/*
 返回符合条件的第一个对象，没有返回nil
 */
FOUNDATION_EXPORT id DY_ArrFind(NSArray *arr, BOOL (^check)(id item));

/*
 返回符合条件的所有对象index数组
 */
FOUNDATION_EXPORT NSArray <NSNumber *>* DY_ArrFindAllIndex(NSArray *arr, BOOL (^check)(id item));

/*
 返回符合条件的所有对象
 */
FOUNDATION_EXPORT NSArray * ArrFindAll(NSArray *arr, BOOL (^check)(id item));

/*
 数组转换map方法
 */
FOUNDATION_EXPORT NSMutableArray * DY_ArrMap(NSArray *arr, id (^newItemBlock)(id item));

/*
 合并多个数组,并按条件去重（保留靠前数组的对象）
 */




//---------------------dictionary-------------------
#pragma mark - dictionary

/*
 返回是否字典类型
 */
FOUNDATION_EXPORT BOOL DY_IsKindOfDictionaryClass(id obj);

/*
 非NSDictionary对象转nil
 */
FOUNDATION_EXPORT NSDictionary* DY_NULLToNilDictionary(id obj);



//-----------------number----------------
#pragma mark - number

/*
 返回number数组的基本操作
 type:sum,avg,max,min,stdDev
 */
FOUNDATION_EXPORT NSNumber * DY_NumberArrFoundation(NSArray <NSNumber *>* arr,NSString* type);




@interface DYJMUtil : NSObject


@end
