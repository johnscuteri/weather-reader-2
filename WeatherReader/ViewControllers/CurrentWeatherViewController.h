//
//  CurrentWeatherViewController.h
//  WeatherReader
//
//  Created by John Scuteri on 10/9/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Weather.h"

@interface CurrentWeatherViewController : UIViewController <UIScrollViewDelegate, CLLocationManagerDelegate>

- (IBAction)getWeather:(id)sender;
- (IBAction)saveWeather:(id)sender;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) Weather *weather;
@property (weak, nonatomic) IBOutlet UILabel *latitudeText;
@property (weak, nonatomic) IBOutlet UILabel *longitudeText;
@property (weak, nonatomic) IBOutlet UILabel *localityText;
@property (weak, nonatomic) IBOutlet UILabel *countryText;
@property (weak, nonatomic) IBOutlet UILabel *temperatureText;
@property (weak, nonatomic) IBOutlet UILabel *humidityText;
@property (weak, nonatomic) IBOutlet UILabel *barometricPressureText;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionText;
@property (weak, nonatomic) IBOutlet UILabel *weatherDiscriptionText;
@property (weak, nonatomic) IBOutlet UILabel *dateText;

@end