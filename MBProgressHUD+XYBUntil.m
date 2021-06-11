//
//  MBProgressHUD+XYBUntil.m
//  Auchan
//
//  Created by 杭州帮聚 on 2019/5/5.
//  Copyright © 2019 谢亚波. All rights reserved.
//

#import "MBProgressHUD+XYBUntil.h"

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UIColorFromRGBACOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation MBProgressHUD (XYBUntil)

/**
 显示小菊花
 @parm msg 显示文字
 @parm view 显示到view 上
 **/

+ (void)showMessage:(NSString *__nonnull)msg view:(UIView * __nullable)view
{
    if (msg.length==0) {
        return;
    }
    [self showMessage:msg icon:nil view:view];
}

/**
 显示小菊花
 @parm msg 显示文字
 @parm view 显示到view 上
 @parm icon 小菊花图片
 **/

+ (void)showMessage:(NSString *__nonnull)msg icon:(NSString * __nullable)icon view:(UIView * __nullable)view
{
    if (view == nil) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = msg;
    hud.label.textColor = UIColorFromRGBACOLOR(0x333333);
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.userInteractionEnabled = NO;
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:icon]];
    hud.bezelView.backgroundColor = RGBACOLOR(186, 186, 186, 1);
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:msg.length/4>2?msg.length/4:2];
}

/**
 显示文字并自动消失
 **/

+ (void)showMessage:(NSString *__nonnull)msg
{
    [self showMessage:msg view:nil];
}

/**
 小菊花消失
 **/

+ (void)hiddenHUD
{
    [self hiddenHUDForView:nil];
}

+ (void)hiddenHUDForView:(UIView * __nullable)view
{
    if (view == nil) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    [self hideHUDForView:view animated:YES];
}

/**
 提示成功
 **/

+ (void)showMsgSucess:(NSString *)msg
{
    [self showMessage:msg icon:@"MJRefresh.bundle/arrow.png" view:nil];
}

/**
 提示失败
 **/
+ (void)showMsgError:(NSString *)msg
{
    [self showMessage:msg icon:@"MBProgressHUD.bundle/error.png" view:nil];
}


+ (MBProgressHUD *)showActivityMessage:(NSString * __nullable)msg view:(UIView *__nullable)view
{
    if (view == nil) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = msg;
    hud.label.textColor = UIColorFromRGBACOLOR(0x333333);
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.userInteractionEnabled = NO;
    hud.bezelView.backgroundColor = RGBACOLOR(186, 186, 186, 1);
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

@end
