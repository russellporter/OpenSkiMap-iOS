//
//  SKViewController.m
//  OpenSkiMap
//
//  Created by Russell Porter on 2012-10-30.
//  Copyright (c) 2012 Russell Porter. All rights reserved.
//

#import "SKViewController.h"
#import "TileOverlay.h"
#import "TileOverlayView.h"
#import "NSUserDefaults+OpenSkiMap.h"

static NSString * const kMapRectUserDefault = @"MapRect";

@interface SKViewController ()

@end

@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapView.delegate = self;
    TileOverlay *overlay = [[TileOverlay alloc] initOverlay];
    [self.mapView addOverlay:overlay];
    self.mapView.visibleMapRect = [self retrieveCurrentMapRect];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)ovl
{
    TileOverlayView *view = [[TileOverlayView alloc] initWithOverlay:ovl];
    view.tileAlpha = 1.0;
    return view;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults] setMapRect:mapView.visibleMapRect forKey:kMapRectUserDefault];
}

- (MKMapRect)retrieveCurrentMapRect
{
    MKMapRect rect = [[NSUserDefaults standardUserDefaults] mapRectForKey:kMapRectUserDefault];
    if (MKMapRectIsNull(rect)) {
        rect = self.mapView.visibleMapRect;
    }

    return rect;
}

@end
