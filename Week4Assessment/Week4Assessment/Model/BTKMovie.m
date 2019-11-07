//
//  BTKMovie.m
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKMovie.h"

@implementation BTKMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview //image:(UIImage *)image
{
    self = [self init];
    
    if (self)
    {
        _title = title;
        _rating = rating;
        _overview = overview;
//        _image = image;
    }
    
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSNumber *rating = dictionary[@"vote_average"];
    NSString *overview = dictionary[@"overview"];
    //UIImage *image =    dictionary[@"poster_path"];
    
    return [self initWithTitle:title rating:rating overview:overview]; //image:image];
}

@end
