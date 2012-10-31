//
//  NSUserDefaults+OpenSkiMap.m
//  OpenSkiMap
//
//  Created by Russell Porter on 2012-10-30.
//  Copyright (c) 2012 Russell Porter. All rights reserved.
//

#import "NSUserDefaults+OpenSkiMap.h"

static NSString * const kMapRectX = @"x";
static NSString * const kMapRectY = @"x";
static NSString * const kMapRectWidth = @"width";
static NSString * const kMapRectHeight = @"height";

@implementation NSUserDefaults (OpenSkiMap)

- (void)setMapRect:(MKMapRect)mapRect forKey:(NSString *)defaultName
{
    NSDictionary *data = @{
        kMapRectX : @(mapRect.origin.x),
        kMapRectY : @(mapRect.origin.y),
        kMapRectWidth : @(mapRect.size.width),
        kMapRectHeight : @(mapRect.size.height)
    };
    [self setObject:data forKey:defaultName];
}

- (MKMapRect)mapRectForKey:(NSString *)defaultName
{
    NSDictionary *data = [self objectForKey:defaultName];
    if (!data) {
        return MKMapRectNull;   
    }
    return MKMapRectMake(((NSNumber *)data[kMapRectX]).doubleValue,
                         ((NSNumber *)data[kMapRectY]).doubleValue,
                         ((NSNumber *)data[kMapRectWidth]).doubleValue,
                         ((NSNumber *)data[kMapRectHeight]).doubleValue);
}

@end
