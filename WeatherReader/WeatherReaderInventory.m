//
//  WeatherReaderInventory.m
//  WeatherReader
//
//  Created by John Scuteri on 11/16/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "WeatherReaderInventory.h"

@implementation WeatherReaderInventory

+ (WeatherReaderInventory *)sharedInstance {
    static dispatch_once_t once;
    static WeatherReaderInventory *sharedInstance;
    NSString *bundleId =  [[NSBundle mainBundle] bundleIdentifier];
    dispatch_once(&once, ^{
        NSSet *itemIds = [NSSet setWithObjects:
                                      [NSString stringWithFormat:@"%@.noads",bundleId],
                                      nil];
        sharedInstance = [[self alloc] initWithIds:itemIds];
    });
    return sharedInstance;
}

@end
