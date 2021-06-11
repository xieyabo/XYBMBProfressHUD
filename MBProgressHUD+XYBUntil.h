//
//  MBProgressHUD+XYBUntil.h
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/5.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (XYBUntil)

/**
 显示小菊花
 @parm msg 显示文字
 @parm view 显示到view 上
 **/

+ (void)showMessage:(NSString *)msg view:(UIView * __nullable)view;

/**
 显示小菊花+文字
 @parm msg 显示文字
 @parm view 显示到view 上
 @parm icon 小菊花图片
 **/

+ (void)showMessage:(NSString *)msg icon:(NSString * __nullable)icon view:(UIView * __nullable)view;

/**
 只显示文字并自动消失
 **/

+ (void)showMessage:(NSString *)msg;

/**
 小菊花消失
 **/

+ (void)hiddenHUD;

/**
 小菊花消失
 **/
+ (void)hiddenHUDForView:(UIView * __nullable)view;

/**
 提示成功
 **/

+ (void)showMsgSucess:(NSString *)msg;

/**
 提示失败
 **/
+ (void)showMsgError:(NSString *)msg;

/**
 加载中
**/
+ (MBProgressHUD *)showActivityMessage:(NSString * __nullable)msg view:(UIView *__nullable)view;


@end

NS_ASSUME_NONNULL_END
