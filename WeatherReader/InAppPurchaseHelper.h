//
//  InAppPurchaseHelper.h
//  WeatherReader
//
//  Created by John Scuteri on 11/15/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestProductsCompletionHandler)(BOOL success, NSArray * products);

@interface InAppPurchaseHelper : NSObject

- (id)initWithIds:(NSSet *)productIdentifiers;
- (void)requestItems:(RequestProductsCompletionHandler)completionHandler;

@end