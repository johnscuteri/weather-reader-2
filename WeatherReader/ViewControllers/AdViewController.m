//
//  AdViewController.m
//  WeatherReader
//
//  Created by John Scuteri on 10/16/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "AdViewController.h"
#import <GADBannerView.h>
#import <GADRequest.h>

@interface AdViewController ()

@end

@implementation AdViewController {
    CGRect adRect;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    adRect = CGRectMake(0, 0, 320, 50);
    /*Image
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    if (screenWidth > 320) {
        CGFloat x = ((screenWidth - 320) / 2);
        adRect = CGRectMake(x, 0, 320, 50);
    }
    _imageBanner = [[UIImageView alloc]initWithFrame:adRect];
    [_imageBanner setImage:[UIImage imageNamed:@"weather_reader_banner.jpg"]];
    [self.view addSubview:_imageBanner];
    //END Image*/

    /*iAD
    _iAdBannerViewProperty = [[ADBannerView alloc] initWithFrame:adRect];
    [self.view addSubview:_iAdBannerViewProperty];
    _iAdBannerViewProperty.delegate = self;
    _iAdBannerViewProperty.hidden = YES;
    //END iAD*/
    
    //AdMob
    //Get Key - This file is not under version control for a reason
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"apistuff" ofType:@"plist"];
    NSDictionary *plistData = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    _adMobBannerViewProperty = [[GADBannerView alloc]initWithFrame:adRect];
    _adMobBannerViewProperty.adUnitID = [plistData objectForKey:@"ad_mob"];
    _adMobBannerViewProperty.delegate = self;
    [_adMobBannerViewProperty setRootViewController:self];
    //END adMob*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    // Advert has been dismissed. Resume paused activities
}

- (void)viewWillDisappear:(BOOL)animated
{
    // View is about to be obscured by an advert.
    //Pause activities if necessary
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    //[self.view addSubview:banner];
    //[self.view layoutIfNeeded];
    //Note that the above code does not attempt to position the ad rectangle. In a real world application code will need to be added so that the ad appears in the appropriate location on the view.
    
    //Close up admob
    
    _iAdBannerViewProperty.hidden = FALSE;
    NSLog(@"showing");
}
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    //[banner removeFromSuperview];
    //[self.view layoutIfNeeded];
    //As with the banner ad format, a full screen advertisement will be displayed in the event that the user taps on the rectangle ad. Once again, the viewWillDisappear and viewWillAppear delegate methods may be used to pause and resume the application
    
    _iAdBannerViewProperty.hidden = TRUE;
    NSLog(@"hidden");
    
    //Set up up admob
    [self.view addSubview:_adMobBannerViewProperty];
    [_adMobBannerViewProperty loadRequest:[self createAdMobRequest]];

}
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"Banner view is beginning an ad action");
    // pause audio...
    
    return YES;
}
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    NSLog(@"Banner view is finishing an ad action");
    // resume audio ...
}
- (GADRequest *)createAdMobRequest {
    GADRequest *request = [GADRequest request];
    request.testDevices = [NSArray arrayWithObjects:GAD_SIMULATOR_ID,@"TheIDAppearingInLogs",nil];
    return request;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
