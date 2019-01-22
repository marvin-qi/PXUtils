//
//  PXUtilsMacros.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/21.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsMacros_h
#define PXUtilsMacros_h

#define PXUtilsLazy(object, assignment) (object = object ?: assignment)

#define PXUtilsWeakType(type)    __weak typeof(type) weak##type = type
#define PXUtilsStrongType(type)  __strong typeof(type) type = weak##type
#define PXUtilsBlockType(type)   __block typeof(type)  block##type = type

#define PXUtilsAvailableVersion(version) @available(iOS version,*)
#define PXUtilsAvailableiOS11            @available(iOS 11.0,*)

#define PXUtilsNotificationCenter [NSNotificationCenter defaultCenter]
#define PXUtilsUserDefaults       [NSUserDefaults standardUserDefaults]
#define PXUtilsApplication        [UIApplication sharedApplication]

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
#define PXUtilsPrintPrivatePropertyName(ClassName) \
    unsigned int count = 0;\
    Ivar *ivarList = class_copyIvarList([NSClassFromString(ClassName) class], &count);\
    for (int i = 0; i<count; i++) {\
        Ivar ivar = ivarList[i];\
            PXUtilsLog(@"%s",ivar_getName(ivar));\
        }\
    free(ivarList)


#endif /* PXUtilsMacros_h */
