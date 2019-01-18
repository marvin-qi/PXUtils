//
//  PXUtilsMacros.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsMacros_h
#define PXUtilsMacros_h

#define PXScreenScale           [[UIScreen mainScreen] scale]
#define PXScreenBounds          [[UIScreen mainScreen] bounds]
#define PXScreenWidth           [[UIScreen mainScreen] bounds].size.width
#define PXScreenHeight          [[UIScreen mainScreen] bounds].size.height

#define PXUtilsLazy(object, assignment) (object = object ?: assignment)

#define PXWeakType(type)    __weak typeof(type) weak##type = type
#define PXStrongType(type)  __strong typeof(type) type = weak##type
#define PXBlockType(type)   __block typeof(type)  block##type = type

#define PXAvailableVersion(version) @available(iOS version,*)
#define PXAvailableiOS11 @available(iOS 11.0,*)

#define PXNotificationCenter [NSNotificationCenter defaultCenter]
#define PXUserDefaults [NSUserDefaults standardUserDefaults]
#define PXApplication [UIApplication sharedApplication]

#define PXIOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

//沙盒路径
#define PXHomePath NSHomeDirectory()
//获取沙盒 Document
#define PXDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define PXPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 temp
#define PXPathTemp NSTemporaryDirectory()
//Library/Caches 文件路径
#define PXFilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])

/**
 DEBUG打印
 */
#define DEBUGLOG
#ifdef DEBUGLOG
#      define PXUtilsLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#      define PXUtilsLog(...)
#endif

/**
 打印类私有变量

 @param ClassName 要打印的类
 */
#define PXLogPrivatePropertyName(ClassName) \
    unsigned int count = 0;\
    Ivar *ivarList = class_copyIvarList([NSClassFromString(ClassName) class], &count);\
    for (int i = 0; i<count; i++) {\
        Ivar ivar = ivarList[i];\
        PXUtilsLog(@"%s",ivar_getName(ivar));\
    }\
    free(ivarList)


#endif /* PXUtilsMacros_h */
