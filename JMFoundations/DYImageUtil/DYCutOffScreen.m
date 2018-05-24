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
//  DYCutOffScreen.m
//  IntelligenceResearchReport
//
//  Created by datayes on 16/7/5.
//

#import "DYCutOffScreen.h"

@implementation DYCutOffScreen

//根据view截取image
+ (UIImage*)screenView:(UIView *)view{
    CGSize s = view.bounds.size;
    return [self screenView:view withSize:s];
}

//根据view截取image,自定义截取区域size
+ (UIImage*)screenView:(UIView *)view withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

//根据view截取image，包括导航栏
+ (UIImage*)screenNavigationView:(UIViewController *)viewC{
    CGSize s = viewC.view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [viewC.navigationController.view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

// 截取长图，如继承scrollView的TableView，CollectionView
+ (UIImage *)screenScrollView:(UIScrollView *)scrollView {
    return [self screenScrollView:scrollView withSize:scrollView.contentSize];
}

// 截取长图，例子如上，可自定义截取区域size
+ (UIImage *)screenScrollView:(UIScrollView *)scrollView withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    //保存scrollView当前的偏移量
    CGPoint savedContentOffset = scrollView.contentOffset;
    CGRect savedFrame = scrollView.frame;
    
    //将scrollView的偏移量设置为(0,0)
    scrollView.contentOffset = CGPointZero;
    scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
    
    // 渲染出view，并生成image
    [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *tableImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //恢复scrollView的偏移量
    scrollView.contentOffset = savedContentOffset;
    scrollView.frame = savedFrame;
    UIGraphicsEndImageContext();
    return tableImage;
}

//将image2拼接到image1中
+ (UIImage *)addImage:(UIImage *)image2 UnderImage:(UIImage *)image1 {
    
    double mainScale=[UIScreen mainScreen].scale;
    //画布size
    CGSize s = CGSizeMake(image1.size.width, image1.size.height + image2.size.height*image1.size.width/image2.size.width);
    UIGraphicsBeginImageContextWithOptions(s,NO,mainScale);
    // Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    // Draw image2
    [image2 drawInRect:CGRectMake(0, image1.size.height, image1.size.width, image2.size.height*image1.size.width/image2.size.width)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

//压缩图片
+ (UIImage *)cutImg:(UIImage *)image withSize:(CGSize)size{
    //微信压缩预览图
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height*image.size.height/image.size.width));
    [image drawInRect:CGRectMake(0, 0, size.width, size.height*image.size.height/image.size.width)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
