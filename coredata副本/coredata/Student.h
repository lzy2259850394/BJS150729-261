//
//  Student.h
//  coredata
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 Doctor.Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class OwnClass;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * sid;
@property (nonatomic, retain) NSString * ownClass;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) OwnClass *r2Class;

@end
