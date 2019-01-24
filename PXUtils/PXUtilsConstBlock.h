//
//  PXUtilsConstBlock.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/24.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsConstBlock_h
#define PXUtilsConstBlock_h

typedef void(^kPXUtilsCompleted)(BOOL completed);
typedef void(^kPXUtilsCompletedResponse)(BOOL completed, id _Nullable response);
typedef void(^kPXUtilsCompletedIntValue)(BOOL completed, NSInteger intValue);
typedef void(^kPXUtilsCompletedString)(BOOL completed, NSString *_Nullable stringValue);

#endif /* PXUtilsConstBlock_h */
