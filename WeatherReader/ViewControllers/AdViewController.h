//
//  AdViewController.h
//  WeatherReader
//
//  Created by John Scuteri on 10/16/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/ADBannerView.h"
#import <GADBannerViewDelegate.h>

@interface AdViewController : UIViewController <ADBannerViewDelegate, GADBannerViewDelegate> {
    ADBannerView *iAdBannerView;
    GADBannerView *adMobBannerVew;
    NSTimer *adMobTimer;
}

@property (nonatomic, retain) IBOutlet ADBannerView *iAdBannerViewProperty;
@property (nonatomic, retain) IBOutlet GADBannerView *adMobBannerViewProperty;
@property (nonatomic, retain) IBOutlet UIImageView *imageBanner;
@property (nonatomic, retain) NSTimer *adMobTimerProperty;

@end
