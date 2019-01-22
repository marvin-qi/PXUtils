//
//  PXUtilsSingleton.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/18.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsSingleton_h
#define PXUtilsSingleton_h

// .h文件
#define PXUtilsSingletonH(name) + (instancetype)share##name;

// .m文件
#if __has_feature(objc_arc)

#define PXUtilsSingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instace = [super allocWithZone:zone]; \
    }); \
    return _instace; \
} \
\
+ (instancetype)share##name { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instace = [[self alloc] init]; \
    }); \
    return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone { \
    return _instace; \
}

#else

#define PXUtilsSingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instace = [super allocWithZone:zone]; \
    }); \
    return _instace; \
} \
\
+ (instancetype)share##name { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instace = [[self alloc] init]; \
    }); \
    return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone { \
    return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}

#endif

#endif /* PXUtilsSingleton_h */
