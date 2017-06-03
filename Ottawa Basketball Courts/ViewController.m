//
//  ViewController.m
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2016-09-10.
//  Copyright © 2016 JsonTextfield. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Court.h"
#import "MyDB.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc]init];
    [_locationManager requestWhenInUseAuthorization];
    CLLocation* t = [[CLLocation alloc] initWithLatitude:45.35 longitude:-75.7];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (t.coordinate, 2000, 2000);
    [_mapView setRegion:region animated:NO];
    MKMapCamera* newCamera = [[_mapView camera] copy];
    [newCamera setHeading:-30.0]; // or newCamera.heading + 90.0 % 360.0
    [_mapView setCamera:newCamera animated:NO];
    
    
    NSArray* courts = [MyDB database].courts;
    for (Court* it in courts){
        MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
        marker.coordinate = it.location.coordinate;
        marker.title = [NSString stringWithFormat:@"%@ - %@", it.name, it.courtType];
        [_mapView addAnnotation: (marker)];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
