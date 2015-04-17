//
//  HostViewController.m
//  WeatherReader
//
//  Created by John Scuteri on 10/16/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "HostViewController.h"
#import "MainViewController.h"
#import "CurrentWeatherViewController.h"
#import "WeatherHistoryViewController.h"

@interface HostViewController ()

@end

@implementation HostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue destinationViewController] isMemberOfClass:[MainViewController class]]) {
        MainViewController *mainviewController = [segue destinationViewController];
        NSArray *controllers = [mainviewController viewControllers];
        if ([controllers[1] isMemberOfClass:[CurrentWeatherViewController class]]) {
            CurrentWeatherViewController *currentWeatherViewController = controllers[1];
            [currentWeatherViewController setManagedObjectContext:_managedObjectContext];
        }
        if ([controllers[2] isMemberOfClass:[WeatherHistoryViewController class]]) {
            WeatherHistoryViewController *weatherHistoryViewController = controllers[2];
            [weatherHistoryViewController setManagedObjectContext:_managedObjectContext];
        }
        //[mainviewController setManagedObjectContext:_managedObjectContext];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
