//
//  PXUtilsConstBlock.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/22.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsConstBlock_h
#define PXUtilsConstBlock_h

typedef void(^pxUtilsCompleted)(BOOL completed);
typedef void(^pxUtilsCompletedResponse)(BOOL completed, id _Nullable response);
typedef void(^pxUtilsCompletedIntValue)(BOOL completed, NSInteger intValue);
typedef void(^pxUtilsCompletedString)(BOOL completed, NSString stringValue);

#endif /* PXUtilsConstBlock_h */
