//
//  WeatherGather.m
//  WeatherReader
//
//  Created by John Scuteri on 2/21/15.
//  Copyright (c) 2015 John Scuteri. All rights reserved.
//

#import "WeatherGather.h"
#import "AFHTTPRequestOperation.h"
#import <CoreData/CoreData.h>

@implementation WeatherGather
{
}

- (id) init {
    self = [super init];
    if (self) {
    }
    return self;
}

+ (double)convertTempToFahrenheit:(double)tempInKelvin {
    return (((tempInKelvin - 273.15) * 1.8) + 32);
}

+ (double)convertTempToCelsius:(double)tempInKelvin {
    return tempInKelvin - 273.15;
}


- (void)getWeateherDataWithCompletionHandler:(void(^)(Weather*))completionHandler {
    
    //Get Key - This file is not under version control for a reason
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"apistuff" ofType:@"plist"];
    NSDictionary *plistData = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    
    double lat = 40.73, lon = -73.44;
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&APPID=%@",lat, lon, [plistData objectForKey:@"weather"]];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        Weather *weather = [NSEntityDescription
                              insertNewObjectForEntityForName:@"Weather"
                              inManagedObjectContext:_managedObjectContext];
        //Weather *weather = [[Weather alloc]init];
        NSDictionary *parsedDict = (NSDictionary *)responseObject;
        NSDictionary *location = [parsedDict valueForKey:@"coord"];
        NSDictionary *mainDict = [parsedDict valueForKey:@"main"];
        NSDictionary *windStuff = [parsedDict valueForKey:@"wind"];
        NSArray *conditions = [parsedDict valueForKey:@"weather"];
        NSDictionary *conditions1 = conditions[0];
        NSDictionary *locality = [parsedDict valueForKey:@"sys"];
        NSDate *now = [[NSDate alloc]init];
        [weather setTemperature:[NSNumber numberWithDouble:[[mainDict valueForKey:@"temp"]doubleValue]]];
        [weather setHumidity:[NSNumber numberWithDouble:[[mainDict valueForKey:@"humidity"]doubleValue]]];
        [weather setBarometricPressure:[NSNumber numberWithDouble:[[mainDict  valueForKey:@"pressure"]doubleValue]]];
        [weather setWindDirection:[NSNumber numberWithDouble:[[windStuff valueForKey:@"deg"]doubleValue]]];
        [weather setWeatherDescription:[conditions1 valueForKey:@"description"]];
        [weather setWindSpeed:[NSNumber numberWithDouble:[[windStuff valueForKey:@"speed"]doubleValue]]];
        [weather setLat:[NSNumber numberWithDouble:[[location valueForKey:@"lat"]doubleValue]]];
        [weather setLon:[NSNumber numberWithDouble:[[location valueForKey:@"lon"]doubleValue]]];
        [weather setName:[parsedDict valueForKey:@"name"]];
        [weather setCountry:[locality valueForKey:@"country"]];
        [weather setWeatherDate:now];
        completionHandler(weather);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        Weather *weather;
        completionHandler(weather);
    }];
    [operation start];
}

@end