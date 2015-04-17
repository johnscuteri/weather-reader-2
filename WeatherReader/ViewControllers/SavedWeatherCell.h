//
//  SavedWeatherCell.h
//  WeatherReader
//
//  Created by John Scuteri on 2/28/15.
//  Copyright (c) 2015 John Scuteri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedWeatherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cityText;
@property (weak, nonatomic) IBOutlet UILabel *countryText;
@property (weak, nonatomic) IBOutlet UILabel *dateText;
@property (weak, nonatomic) IBOutlet UILabel *temperatureText;
@property (weak, nonatomic) IBOutlet UILabel *humidityText;
@property (weak, nonatomic) IBOutlet UILabel *barometricPressureText;

@end
