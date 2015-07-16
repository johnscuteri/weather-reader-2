//
//  SettingsViewController.h
//  WeatherReader
//
//  Created by John Scuteri on 10/9/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (IBAction)buttonNoAds:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *gpsControl;

@property (weak, nonatomic) IBOutlet UITextField *postalCodeField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *units;


@end
