//
//  PXUtilsConstInline.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/18.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsConstInline_h
#define PXUtilsConstInline_h

/**
 是否是iPhone X以上的机型
 */
#define PXUtilsIsIPhoneX ([[UIApplication sharedApplication] statusBarFrame].size.height>20)

#define PXUtilsScreenScale       [[UIScreen mainScreen] scale]
#define PXUtilsScreenBounds      [[UIScreen mainScreen] bounds]
#define PXUtilsScreenWidth       [[UIScreen mainScreen] bounds].size.width
#define PXUtilsScreenHeight      [[UIScreen mainScreen] bounds].size.height

/**
 状态栏高度
 */
static inline CGFloat PXUtilsStatusBarHeight(){
    return (PXUtilsIsIPhoneX ? 44.f : 20.f);
}

/**
 导航栏高度，包含状态栏
 */
static inline CGFloat PXUtilsNavBarHeight(){
    return (PXUtilsIsIPhoneX ? 88.f : 64.f);
}

/**
 Tab栏高度，包含iPhone X控制条
 */
static inline CGFloat PXUtilsTabBarHeight(){
    return (PXUtilsIsIPhoneX ? 83.f : 49.f);
}

/**
 iPhone X控制条高度
 */
static inline CGFloat PXUtilsIndicatorBarHeight(){
    return (PXUtilsIsIPhoneX ? 34.f : 0.f);
}

/**
 键盘高度
 */
static inline CGFloat PXUtilsKeyBoardHeight(){
    return (PXUtilsIsIPhoneX ? 291.f : 216.0f);
}

/**
 以iPhone6为参照的宽
 */
static inline CGFloat PXUtilsWidthByIP6(CGFloat width){
    return roundf(width * PXUtilsScreenHeight / 667.0);
}

/**
 以iPhone6为参照的高
 */
static inline CGFloat PXUtilsHeightByIP6(CGFloat height){
    return roundf(height * PXUtilsScreenWidth / 375.0);
}

/**
 以iPhone6P为参照的宽
 */
static inline CGFloat PXUtilsWidthByIP6P(CGFloat width){
    return roundf(width * PXUtilsScreenHeight / 736.0);
}

/**
 以iPhone6P为参照的高
 */
static inline CGFloat PXUtilsHeightByIP6P(CGFloat height){
    return roundf(height * PXUtilsScreenWidth / 414.0);
}

/**
 获取图片

 @param imageName 图片名字
 */
static inline UIImage * PXUtilsImageNamed(NSString *imageName){
    return [UIImage imageNamed:imageName];
}

/**
 普通字体

 @param fontSize 字体大小
 */
static inline UIFont *PXUtilsFont(CGFloat fontSize){
    return [UIFont systemFontOfSize:fontSize];
}

/**
 粗体字

 @param fontSize 字体大小
 */
static inline UIFont *PXUtilsBoldFont(CGFloat fontSize){
    return [UIFont boldSystemFontOfSize:fontSize];
}

/**
 int转string
 */
static inline NSString *PXUtilsIntToString(NSInteger intValue){
    return [NSString stringWithFormat:@"%@",@(intValue)];
}

static inline CGFloat PXIOSVersion(){
    return ([[[UIDevice currentDevice] systemVersion] floatValue]);
}

/**
 沙盒路径
 */
static inline NSString *PXUtilsHomePath(){
    return NSHomeDirectory();
}
/**
 获取沙盒 Document
 */
static inline NSString *PXUtilsDocumentPath(){
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) firstObject];
}

/**
 获取沙盒 Cache
 */
static inline NSString *PXUtilsPathCache(){
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, TRUE) firstObject];
}

/**
 获取沙盒 temp
 */
static inline NSString *PXUtilsPathTemp(){
    return NSTemporaryDirectory();
}

/**
 Library/Caches 文件路径
 */
static inline NSURL *PXUtilsFilePath(){
    return [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:TRUE error:nil];
}

/**
 App名字
 */
static inline NSString *PXUtilsAppName(){
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

/**
 App版本号
 */
static inline NSString *PXUtilsAppVersion(){
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/**
 App Build号
 */
static inline NSString *PXUtilsAppBuildVersion(){
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

/**
 设备名称
 */
static inline NSString *PXUtilsSystemName(){
    return [UIDevice currentDevice].systemName;
}

/**
 iOS版本
 */
static inline NSString *PXUtilsSystemVersion(){
    return [UIDevice currentDevice].systemVersion;
}

/**
 UUID
 */
static inline NSString *PXUtilsUuid(){
    return [UIDevice currentDevice].identifierForVendor.UUIDString;
}

/**
 设备别名
 */
static inline NSString *PXUtilsDeviceName(){
    return [UIDevice currentDevice].name;
}

/**
 设备型号
 */
static inline NSString *PXUtilsDeviceModel(){
    return [UIDevice currentDevice].model;
}

/**
 设备地方型号(国际化)
 */
static inline NSString *PXUtilsLocalizedModel(){
    return [UIDevice currentDevice].localizedModel;
}

#endif /* PXUtilsConstInline_h */
