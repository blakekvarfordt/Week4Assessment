//
//  BTKMovieController.h
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTKMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTKMovieController : NSObject

+ (void)fetchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void(^) (NSArray<BTKMovie *> *movies))completion;


//+ (void)fetchimage:(BTKMovie *)image completion:(void(^) (UIImage *))completion;


@end

NS_ASSUME_NONNULL_END
