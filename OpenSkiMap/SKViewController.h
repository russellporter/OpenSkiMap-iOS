//
//  SKViewController.h
//  OpenSkiMap
//
//  Created by Russell Porter on 2012-10-30.
//  Copyright (c) 2012 Russell Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SKViewController : UIViewController <MKMapViewDelegate>
@property (retain, nonatomic) IBOutlet MKMapView *mapView;

@end
