//
//  BTKMovieController.m
//  Week4Assessment
//
//  Created by Blake kvarfordt on 8/23/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKMovieController.h"

static NSString * const baseURL = @"https://api.themoviedb.org/3/search/movie";
static NSString * const queryKey = @"query";
static NSString * const apiKey = @"api_key";
static NSString * const apiKeyValue = @"feb94c0b93eb522d6e6ac65999f17cbd";
//static NSString * const imageKey = @"movi_id"


@implementation BTKMovieController

+ (void)fetchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<BTKMovie *> *))completion
{
    NSURL *legitBaseURL = [NSURL URLWithString:baseURL];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:legitBaseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:queryKey value:searchTerm];
    
    NSURLQueryItem *legitApiKey = [NSURLQueryItem queryItemWithName:apiKey value:apiKeyValue];
    
    components.queryItems = @[queryItem, legitApiKey];
    
    NSURL *finalURL = [components URL];
    
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData *data, NSURLResponse * response, NSError *error) {
        
        if (error)
        {
            NSLog(@"Error fetching url%@", error);
            completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"Error with the data %@", error);
            completion(nil);
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        NSArray *resultsArray = topLevelDictionary[@"results"];
        
        NSMutableArray *moviesArray = [NSMutableArray new];
        
        for (NSDictionary *movieDict in resultsArray)
        {
            BTKMovie *movie = [[BTKMovie alloc] initWithDictionary:movieDict];
            
            [moviesArray addObject:movie];
            
            completion(moviesArray);
        }
        
    }]resume];
    
}

//+ (void)fetchimage:(BTKMovie *)image completion:(void (^)(UIImage * ))completion
//{
//    NSString *imageURL = [[NSString alloc] initWithFormat:@"%@", image.image ];
//    
//    NSURL *legitImage = [[NSURL alloc] initWithString:imageURL];
//    
//    [[NSURLSession.sharedSession dataTaskWithURL:legitImage completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError *  _Nullable error) {
//        
//        if (error)
//        {
//            NSLog(@"ERROR with Image %@", error);
//            completion(nil); return;
//        }
//        
//        if (!data)
//        {
//            NSLog(@"ERROR with data %@", error);
//            completion(nil); return;
//        }
//        
//        UIImage *realDealImage = [[UIImage alloc] initWithData:data];
//        
//        completion(realDealImage);
//        
//    }]resume];
//    
//}
    @end
    
