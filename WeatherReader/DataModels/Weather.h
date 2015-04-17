//
//  Weather.h
//  WeatherReader
//
//  Created by John Scuteri on 11/2/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Weather : NSManagedObject

@property (nonatomic, retain) NSNumber * barometricPressure;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * humidity;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lon;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * temperature;
@property (nonatomic, retain) NSDate * weatherDate;
@property (nonatomic, retain) NSString * weatherDescription;
@property (nonatomic, retain) NSNumber * windDirection;
@property (nonatomic, retain) NSNumber * windSpeed;

@end
