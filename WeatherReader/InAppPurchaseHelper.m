//
//  InAppPurchaseHelper.m
//  WeatherReader
//
//  Created by John Scuteri on 11/15/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "InAppPurchaseHelper.h"
@import StoreKit;

@interface InAppPurchaseHelper() <SKProductsRequestDelegate>

@end

@implementation InAppPurchaseHelper {
    SKProductsRequest *itemsRequest;
    RequestProductsCompletionHandler rpcHandler;
    NSSet *itemIds;
    NSMutableSet *purchasedItemIds;
}

- (id)initWithIds:(NSSet *)productIdentifiers{
    if ((self = [super init])) {
        itemIds = productIdentifiers;
        purchasedItemIds = [NSMutableSet set];
        for (NSString *itemId in itemIds) {
            if ([[NSUserDefaults standardUserDefaults] boolForKey:itemId]) {
                [purchasedItemIds addObject:itemId];
                NSLog(@"Previously purchased: %@", itemId);
            } else {
                NSLog(@"Not purchased: %@", itemId);
            }
        }
        
    }
    return self;
}

- (void)requestItems:(RequestProductsCompletionHandler)completionHandler {
    rpcHandler = [completionHandler copy];
    itemsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:itemIds];
    itemsRequest.delegate = self;
    [itemsRequest start];
}

#pragma mark - SKProductsRequestDelegate

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    NSLog(@"Loaded list of products...");
    itemsRequest = nil;
    NSArray *skItems = response.products;
    for (SKProduct *skItem in skItems) {
        NSLog(@"Found item: %@ %@ %0.2f",
              skItem.productIdentifier,
              skItem.localizedTitle,
              skItem.price.floatValue);
    }
    rpcHandler(YES, skItems);
    rpcHandler = nil;
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"Failed to load list of items.");
    itemsRequest = nil;
    rpcHandler(NO, nil);
    rpcHandler = nil;
}

@end

