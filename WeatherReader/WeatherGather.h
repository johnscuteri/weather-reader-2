//
//  WeatherGather.h
//  WeatherReader
//
//  Created by John Scuteri on 2/21/15.
//  Copyright (c) 2015 John Scuteri. All rights reserved.
//

@import Foundation;
@import CoreLocation;
#import "Weather.h"

@interface WeatherGather : NSObject

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

+ (double)convertTempToFahrenheit:(double)tempInKelvin;
+ (double)convertTempToCelsius:(double)tempInKelvin;
- (void)getWeateherDataWithCompletionHandler:(void(^)(Weather*))completionHandler;

@end