//
//  BTKMovie.h
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTKMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly, nullable) UIImage *image;


- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating; //image:(UIImage *)image;

@end


@interface BTKMovie (jsonConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
