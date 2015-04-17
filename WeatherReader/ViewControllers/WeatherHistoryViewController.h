//
//  WeatherHistoryViewController.h
//  WeatherReader
//
//  Created by John Scuteri on 12/13/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherHistoryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
