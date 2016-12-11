//
//  ViewController.m
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2016-09-10.
//  Copyright © 2016 JsonTextfield. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Court.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc]init];
    [_locationManager requestWhenInUseAuthorization];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (_locationManager.location.coordinate, 2000, 2000);
    [_mapView setRegion:region animated:NO];
    MKMapCamera* newCamera = [[_mapView camera] copy];
    [newCamera setHeading:-30.0]; // or newCamera.heading + 90.0 % 360.0
    [_mapView setCamera:newCamera animated:NO];
    
    
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"basketball-courts" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error =  nil;
    
    NSArray *jsonDataArray = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error][@"features"];
    
    for (id it in jsonDataArray){
        double lat, lng;
        lat = [[it[@"geometry"][@"coordinates"] objectAtIndex:1] doubleValue];
        lng = [[it[@"geometry"][@"coordinates"] objectAtIndex:0] doubleValue];
        
        CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
        Court* court = [[Court alloc] init:it[@"properties"][@"NAME"] courtType:it[@"properties"][@"COURT_TYPE"] location: location];
        
        MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
        marker.coordinate = court.location.coordinate;
        marker.title = court.name;
        [_mapView addAnnotation: (marker)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
