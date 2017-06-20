//
//  ViewController.h
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2016-09-10.
//  Copyright © 2016 JsonTextfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)selectionChanged:(UISegmentedControl *)sender;
@property NSArray* courts;
@end

