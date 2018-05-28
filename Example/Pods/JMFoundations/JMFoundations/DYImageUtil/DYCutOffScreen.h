/** 
 * 通联数据机密
 * --------------------------------------------------------------------
 * 通联数据股份公司版权所有 © 2013-2016
 * 
 * 注意：本文所载所有信息均属于通联数据股份公司资产。本文所包含的知识和技术概念均属于
 * 通联数据产权，并可能由中国、美国和其他国家专利或申请中的专利所覆盖，并受商业秘密或
 * 版权法保护。
 * 除非事先获得通联数据股份公司书面许可，严禁传播文中信息或复制本材料。
 * 
 * DataYes CONFIDENTIAL
 * --------------------------------------------------------------------
 * Copyright © 2013-2016 DataYes, All Rights Reserved.
 * 
 * NOTICE: All information contained herein is the property of DataYes 
 * Incorporated. The intellectual and technical concepts contained herein are 
 * proprietary to DataYes Incorporated, and may be covered by China, U.S. and 
 * Other Countries Patents, patents in process, and are protected by trade 
 * secret or copyright law. 
 * Dissemination of this information or reproduction of this material is 
 * strictly forbidden unless prior written permission is obtained from DataYes.
 */
//
//  CutOffScreen.h
//  IntelligenceResearchReport
//
//  Created by datayes on 16/7/5.
//  截屏&裁剪

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DYCutOffScreen : NSObject

//根据view截取image
+ (UIImage *)screenView:(UIView *)view;

//根据view截取image,自定义截取区域size
+ (UIImage*)screenView:(UIView *)view withSize:(CGSize)size;

//根据viewC截取image，包括导航栏
+ (UIImage *)screenNavigationView:(UIViewController *)viewC;

// 截取长图，如继承scrollView的TableView，CollectionView
+ (UIImage *)screenScrollView:(UIScrollView *)scrollView;

// 截取长图，例子如上，可自定义截取区域size
+ (UIImage *)screenScrollView:(UIScrollView *)scrollView withSize:(CGSize)size;

//将image2拼接到image1中
+ (UIImage *)addImage:(UIImage *)image2 UnderImage:(UIImage *)image1;

//压缩图片
+ (UIImage *)cutImg:(UIImage *)image withSize:(CGSize)size;

@end
