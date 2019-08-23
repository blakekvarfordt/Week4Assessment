//
//  BTKMovie.h
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTKMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;


- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating;

@end


@interface BTKMovie (jsonConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
