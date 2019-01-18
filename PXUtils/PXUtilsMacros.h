//
//  PXUtilsMacros.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsMacros_h
#define PXUtilsMacros_h

#define PXScreenBounds          [[UIScreen mainScreen] bounds]
#define PXScreenWidth           PXScreenBounds.size.width
#define PXScreenHeight          PXScreenBounds.size.height

//以iPhone6为参照的宽高
#define PXHeightByIP6(height)     roundf(height/375.0 * PXScreenWidth)
#define PXWidthByIP6(Width)       roundf(Width/667.0 * PXScreenHeight)

//以iPhone6P为参照的宽高
#define PXHeightByIP6P(height)     roundf(height/414.0 * PXScreenWidth)
#define PXWidthByIP6P(Width)       roundf(Width/736.0 * PXScreenHeight)

#define PXIsX ([[UIApplication sharedApplication] statusBarFrame].size.height>20)

#define PXUtilsLazy(object, assignment) (object = object ?: assignment)

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
