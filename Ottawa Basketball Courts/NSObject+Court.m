//
//  NSObject+Court.m
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2016-09-10.
//  Copyright © 2016 JsonTextfield. All rights reserved.
//

#import "NSObject+Court.h"

@implementation Court
- (id)init: (NSString*) name courtType: (NSString*) courtType location: (CLLocation*) location
{
    self.courtType = courtType;
    self.name = name;
    self.location = location;
    if (self)
    {
        // superclass successfully initialized, further
        // initialization happens here ...
    }
    return self;
}
@end
