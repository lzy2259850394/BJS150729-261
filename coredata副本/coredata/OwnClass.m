//
//  OwnClass.m
//  coredata
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 Doctor.Liu. All rights reserved.
//

#import "OwnClass.h"
#import "Student.h"


@implementation OwnClass

@dynamic touxiang;
@dynamic teacher;
@dynamic sid;
@dynamic name;
@dynamic r2Student;
-(NSString *)description{
    
    return [NSString stringWithFormat:@"name =%@ ,teacher =%@",self.name,self.teacher];
    
}

@end
