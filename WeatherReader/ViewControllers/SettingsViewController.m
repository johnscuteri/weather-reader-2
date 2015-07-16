//
//  SettingsViewController.m
//  WeatherReader
//
//  Created by John Scuteri on 10/9/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "SettingsViewController.h"
#import "CurrentWeatherViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 1000)];
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender {
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        CurrentWeatherViewController *currentWeatherViewController = (CurrentWeatherViewController *)navController.topViewController;
        [currentWeatherViewController.latitudeText setText: @"segue thing worked"];
    }
}


- (IBAction)buttonNoAds:(id)sender {
    NSLog(@"NoAds");
}

@end
