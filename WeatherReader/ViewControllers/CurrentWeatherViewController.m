//
//  CurrentWeatherViewController.m
//  WeatherReader
//
//  Created by John Scuteri on 10/9/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "CurrentWeatherViewController.h"
#import "WeatherGather.h"

@interface CurrentWeatherViewController ()

@end

@implementation CurrentWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 410)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getWeather:(id)sender {
    WeatherGather *weatherGather = [WeatherGather new];
    [weatherGather setManagedObjectContext:_managedObjectContext];
    [weatherGather getWeateherDataWithCompletionHandler:^(Weather *weather) {
        if (weather) {
            _weather = weather;
            NSLog(@"The result is successfull");
            BOOL imperial = true;
            [_latitudeText setText:[NSString stringWithFormat:@"%@", _weather.lat]];
            [_longitudeText setText:[NSString stringWithFormat:@"%@", _weather.lon]];
            [_localityText setText:[NSString stringWithFormat:@"%@",_weather.name]];
            [_countryText setText:[NSString stringWithFormat:@"%@", _weather.country]];
            if (imperial) {
                [_temperatureText setText:[NSString stringWithFormat:@"%.2f°F",[WeatherGather convertTempToFahrenheit:[_weather.temperature doubleValue]]]];
            }
            [_humidityText setText:[NSString stringWithFormat:@"%@", _weather.humidity]];
            [_barometricPressureText setText:[NSString stringWithFormat:@"%@", _weather.barometricPressure]];
            [_windDirectionText setText:[NSString stringWithFormat:@"%@", _weather.windDirection]];
            [_weatherDiscriptionText setText:[NSString stringWithFormat:@"%@", _weather.weatherDescription]];
            NSLocale *thisLocale = [NSLocale currentLocale];
            [_dateText setText:[_weather.weatherDate descriptionWithLocale:thisLocale]];
        } else {
            NSLog(@"FAILURE HAPPENED");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Connection" message:@"Could not connect to the weather service at this time" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction *action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            //Below is depricated in iOS8
            //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Connection" message:@"Could not connect to the weather service at this time" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            //[alert show];
        }
    }];
}
- (IBAction)saveWeather:(id)sender {
    if (_weather) {
        NSError *error = nil;
        // Save the object to persistent store
        if (![_managedObjectContext save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Save Issue" message:@"For some reason the app couldn't save the weather. Try restarting the app and try again." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction *action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Empty" message:@"You have not gathered the weather. There is nothing to save" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
