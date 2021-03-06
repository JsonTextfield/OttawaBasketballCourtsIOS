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
NSString* stringFormat = @"%@ (%@)";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _courts = [MyDB database].courts;
    [self loadAll];
    [_mapView showAnnotations:_mapView.annotations animated:false];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadAll{
    for (Court* it in _courts){
        MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
        marker.coordinate = it.location.coordinate;
        marker.title = [NSString stringWithFormat:stringFormat, it.name, it.courtType];
        [_mapView addAnnotation: (marker)];
    }
}

- (IBAction)selectionChanged:(UISegmentedControl *)sender {
    NSArray* sections = [[NSArray alloc] initWithObjects:@"full",@"all",@"half", nil];
    [_mapView removeAnnotations:_mapView.annotations];
    
    if(sender.selectedSegmentIndex == 1){
        [self loadAll];
        
    }
    
    else{
        for (Court* it in _courts){
            if([it.courtType  isEqual: sections[sender.selectedSegmentIndex]]){
                MKPointAnnotation*  marker = [[MKPointAnnotation alloc]init];
                marker.coordinate = it.location.coordinate;
                marker.title = [NSString stringWithFormat:stringFormat, it.name, it.courtType];
                [_mapView addAnnotation: (marker)];
            }
        }
        
    }
    
    [_mapView showAnnotations:_mapView.annotations animated:true];
}
@end
