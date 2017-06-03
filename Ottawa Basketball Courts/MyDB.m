//
//  MyDB.m
//  Ottawa Basketball Courts
//
//  Created by Peckford on 2017-06-03.
//  Copyright © 2017 JsonTextfield. All rights reserved.
//


#import "MyDB.h"
#import "NSObject+Court.h"

@implementation MyDB

static MyDB* _database;

+ (MyDB*) database {
    if (_database == nil) {
        _database = [[MyDB alloc] init];
    }
    return _database;
}
- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"basketball" ofType:@"db"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (void)dealloc {
    sqlite3_close(_database);
}

- (int) mycallback{

    return 0;
}

- (NSArray *)courts {
    
    
    
    NSMutableArray* list = [[NSMutableArray alloc] init];
    NSString *query = @"select * from courts";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            long id = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *typeChars = (char *) sqlite3_column_text(statement, 2);
            double lat = sqlite3_column_double(statement, 3);
            double lng = sqlite3_column_double(statement, 4);

            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *type = [[NSString alloc] initWithUTF8String:typeChars];
            
            CLLocation* location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
            
            
            Court* c = [[Court alloc] init: name courtId: &id courtType:type location: location];

            [list addObject:c];
        }
        
        sqlite3_finalize(statement);
    }
    
    return list;
    
}
@end
