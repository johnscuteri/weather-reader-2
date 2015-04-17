//
//  WeatherHistoryViewController.m
//  WeatherReader
//
//  Created by John Scuteri on 12/13/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "WeatherHistoryViewController.h"
#import "SavedWeatherCell.h"
#import "WeatherGather.h"
#import "Weather.h"

int const HEIGHT_OFFSET = 158;

@interface WeatherHistoryViewController ()

@property (strong) NSMutableArray *weatherArray;

@end

@implementation WeatherHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the weather data from core data
    /*
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"FailedBankInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    */
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];//]WithEntityName:@"Weather"];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Weather" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    _weatherArray = [[_managedObjectContext executeFetchRequest:fetchRequest error:&error]copy];
    [_tableView setFrame:CGRectMake(_tableView.frame.origin.x, _tableView.frame.origin.y, _tableView.frame.size.width, (_tableView.frame.size.height - HEIGHT_OFFSET))];
    //[_tableView setRowHeight:204];
    [_tableView reloadData];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _weatherArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"weatherCell";
    SavedWeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Weather *weather = [_weatherArray objectAtIndex:indexPath.row];
    [cell.cityText setText:weather.name];
    [cell.countryText setText:weather.country];
    NSLocale* thisLocale = [NSLocale currentLocale];
    [cell.dateText setText:[NSString stringWithFormat:@"%@",[weather.weatherDate descriptionWithLocale:thisLocale]]];
    [cell.temperatureText setText:[NSString stringWithFormat:@"%.2f°F",[WeatherGather convertTempToFahrenheit:[weather.temperature doubleValue]]]];
    [cell.humidityText setText:[NSString stringWithFormat:@"%@",weather.humidity]];
    [cell.barometricPressureText setText:[NSString stringWithFormat:@"%@",weather.barometricPressure]];
    [cell setBackgroundColor:[UIColor colorWithRed:0.56 green:0.93 blue:0.56 alpha:1]];
    //144, 238, 144
    return cell;
}

@end
