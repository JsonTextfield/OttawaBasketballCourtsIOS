//
//  MyDB.h
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2017-06-03.
//  Copyright © 2017 JsonTextfield. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import <CoreLocation/CoreLocation.h>
@interface MyDB : NSObject {
    sqlite3* _database;
}

+ (MyDB*) database;
- (NSArray*) courts;
@end
