//
//  PXUtilsConstEnum.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/22.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsConstEnum_h
#define PXUtilsConstEnum_h

typedef void(^kPXUtilsCompleted)(BOOL completed);
typedef void(^kPXUtilsCompletedResponse)(BOOL completed, id _Nullable response);
typedef void(^kPXUtilsCompletedIntValue)(BOOL completed, NSInteger intValue);
typedef void(^kPXUtilsCompletedString)(BOOL completed, NSString *_Nullable stringValue);

//typedef NS_ENUM(NSInteger, PXEnum) {
//    
//};

#endif /* PXUtilsConstEnum_h */
