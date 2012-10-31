//
//  NSUserDefaults+OpenSkiMap.h
//  OpenSkiMap
//
//  Created by Russell Porter on 2012-10-30.
//  Copyright (c) 2012 Russell Porter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NSUserDefaults (OpenSkiMap)

- (MKMapRect)mapRectForKey:(NSString *)defaultName;
- (void)setMapRect:(MKMapRect)mapRect forKey:(NSString *)defaultName;

@end
