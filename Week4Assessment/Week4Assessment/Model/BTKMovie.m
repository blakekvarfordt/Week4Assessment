//
//  BTKMovie.m
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKMovie.h"

@implementation BTKMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating
{
    self = [self init];
    
    if (self)
    {
        _title = title;
        _rating = rating;
    }
    
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSNumber *rating = dictionary[@"vote_averate"];
    
    return [self initWithTitle:title rating:rating];
}

@end
