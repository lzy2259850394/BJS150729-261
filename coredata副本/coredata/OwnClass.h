//
//  OwnClass.h
//  coredata
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 Doctor.Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface OwnClass : NSManagedObject

@property (nonatomic, retain) NSData * touxiang;
@property (nonatomic, retain) NSString * teacher;
@property (nonatomic, retain) NSNumber * sid;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *r2Student;
@end

@interface OwnClass (CoreDataGeneratedAccessors)

- (void)addR2StudentObject:(Student *)value;
- (void)removeR2StudentObject:(Student *)value;
- (void)addR2Student:(NSSet *)values;
- (void)removeR2Student:(NSSet *)values;

@end
