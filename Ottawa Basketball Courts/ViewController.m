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


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _courts = [MyDB database].courts;
    for (Court* it in _courts){
        MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
        marker.coordinate = it.location.coordinate;
        marker.title = [NSString stringWithFormat:@"%@ - %@", it.name, it.courtType];
        [_mapView addAnnotation: (marker)];
    }
    [_mapView showAnnotations:_mapView.annotations animated:false];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)selectionChanged:(UISegmentedControl *)sender {
    [_mapView removeAnnotations:_mapView.annotations];
    if(sender.selectedSegmentIndex == 0){
        for (Court* it in _courts){
            if([it.courtType  isEqual: @"full"]){
                MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
                marker.coordinate = it.location.coordinate;
                marker.title = [NSString stringWithFormat:@"%@ - %@", it.name, it.courtType];
                [_mapView addAnnotation: (marker)];}
        }
        
    }
    if(sender.selectedSegmentIndex == 1){
        for (Court* it in _courts){
            MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
            marker.coordinate = it.location.coordinate;
            marker.title = [NSString stringWithFormat:@"%@ - %@", it.name, it.courtType];
            [_mapView addAnnotation: (marker)];
        }
        
    }
    if(sender.selectedSegmentIndex == 2){
        
        for (Court* it in _courts){
            if([it.courtType  isEqual: @"half"]){
                MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
                marker.coordinate = it.location.coordinate;
                marker.title = [NSString stringWithFormat:@"%@ - %@", it.name, it.courtType];
                [_mapView addAnnotation: (marker)];
            }
        }
        
    }
    [_mapView showAnnotations:_mapView.annotations animated:true];
}
@end
