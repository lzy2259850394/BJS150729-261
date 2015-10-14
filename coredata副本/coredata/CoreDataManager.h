//
//  CoreDataManager.h
//  LessonCoreData
//
//  Created by zysun on 14-6-25.
//  Copyright (c) 2014年 www.lanou3g.com 北京蓝鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

//  托管对象上下文
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

+ (CoreDataManager *)defaultManager;

- (void)saveWithSuccessedHandler:(void(^)(void))successedHandler failedHandler:(void(^)(NSError *error))failedHandler;

@end
