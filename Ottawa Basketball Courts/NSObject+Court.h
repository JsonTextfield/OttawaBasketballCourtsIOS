//
//  NSObject+Court.h
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2016-09-10.
//  Copyright © 2016 JsonTextfield. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface Court: NSObject
@property NSString* name;
@property NSString* courtType;
@property CLLocation* location;

- (id)init: (NSString*) name courtType: (NSString*) courtType location: (CLLocation*) location;
@end
