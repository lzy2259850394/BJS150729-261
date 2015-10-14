//
//  CoreDataManager.m
//  LessonCoreData
//
//  Created by zysun on 14-6-25.
//  Copyright (c) 2014年 www.lanou3g.com 北京蓝鸥科技有限公司. All rights reserved.
//

#import "CoreDataManager.h"
#import <UIKit/UIKit.h>

@interface CoreDataManager ()
//  持久化存储协调器
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStroeCoordinator;
//  托管对象模型
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@end

@implementation CoreDataManager

+ (CoreDataManager *)defaultManager
{
    static CoreDataManager *defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [[CoreDataManager alloc] init];
    });
    return defaultManager;
}

- (NSManagedObjectContext *)managedObjectContext
{
    //  如果对象不为空，那么就直接返回当前对象。
    if(_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    //  如果对象为空，那么就创建并初始化一个新的对象。
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [self persistentStroeCoordinator];
    [_managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStroeCoordinator
{
    if(_persistentStroeCoordinator != nil)
    {
        return _persistentStroeCoordinator;
    }
    
    _persistentStroeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSURL *documentURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    
    NSURL *fileURL = [documentURL URLByAppendingPathComponent:@"MyCoreData.sqlite"];

    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@(YES), NSInferMappingModelAutomaticallyOption:@(YES)};
    
    NSError *error = nil;
    [_persistentStroeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:fileURL options:options error:&error];
    if(error != nil)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"添加持久化存储失败！！！" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    return _persistentStroeCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if(_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    //  编译器会自动将“xcdatamodeld”文件编译为“momd”文件。
    NSURL *modelFileURL = [[NSBundle mainBundle] URLForResource:@"MyCoreData" withExtension:@"momd"];
    
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelFileURL];
    
    return _managedObjectModel;
}


- (void)saveWithSuccessedHandler:(void(^)(void))successedHandler failedHandler:(void(^)(NSError *))failedHandler
{
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if(error != nil)
    {
        NSLog(@"保存失败：%@",[error localizedDescription]);
        if(failedHandler != nil)
        {
            failedHandler(error);
        }
    }
    else
    {
        successedHandler();
    }
}

@end
