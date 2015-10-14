//
//  ViewController.m
//  MyCoredata
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 Doctor.Liu. All rights reserved.
//

#import "ViewController.h"
#import"CoreDataManager.h"//touwenjian
#import "OwnClass.h"
#import "Student.h"   //  model
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建好模型
    //初始化类导入
    
    //调用单例类的 上下文的 get 方法 ,触发一些 get 操作,完成 coredata 的初始化操作;
    
    NSManagedObjectContext *managedObjectContext =[CoreDataManager defaultManager].managedObjectContext ; //完成 coredata 初始化
    
    NSLog(@"========== 插入数据==========");
    NSEntityDescription *ownClass =[NSEntityDescription  entityForName:@"OwnClass" inManagedObjectContext:managedObjectContext]; ///从上下文中.和数据库一一映射,把 class 结构拿出来,
    OwnClass *aClass  =[[OwnClass alloc]initWithEntity:ownClass insertIntoManagedObjectContext:managedObjectContext];//
    
    aClass.name =@"yan29" ;
    aClass.teacher =@"kai";
    
    [[CoreDataManager defaultManager]saveWithSuccessedHandler:^{
        NSLog(@"保存插入成功");
    } failedHandler:^(NSError *error) {
        NSLog(@"插入不成功");
    }];
    
    NSLog(@"==========全表查询=====");
    NSFetchRequest  *fetchRequest =[[NSFetchRequest alloc]initWithEntityName:@"OwnClass"];
    
    NSError *error =nil;
    
    NSArray *allClass = [[CoreDataManager defaultManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    //    if (error !=nil) {
    //        NSLog(@"全表查询失败 ,%@",error);
    //    }else{
    //
    //        NSLog(@"全表查询成功");
    //        NSLog(@"====array:%@",allClass);
    //
    //    }
    NSLog(@"====按条件查询 =====");
    NSFetchRequest *fetchRequest1  =[[NSFetchRequest alloc]initWithEntityName:@"OwnClass"];
    fetchRequest1.predicate =[NSPredicate predicateWithFormat:@"teacher =%@ ",@"xiaoqiang"];
    NSArray *oneClass =[[CoreDataManager defaultManager].managedObjectContext executeFetchRequest:fetchRequest1 error:&error];
    if (error != nil) {
        NSLog(@"按条件查询失败");
    }else{
        
        NSLog(@"按条件查询成功");
        NSLog(@"%@",oneClass);
    }
    
    //    NSLog(@"========清空表=====") ;
    //      //全局遍历,查询
    //    for (OwnClass *aClass in allClass) {
    //        [[CoreDataManager defaultManager].managedObjectContext deleteObject:aClass];
    //    }
    //    [[CoreDataManager defaultManager]saveWithSuccessedHandler:^{
    //        NSLog(@"清空表成功");
    //    } failedHandler:^(NSError *error) {
    //        NSLog(@"清空表不成功");
    //    }];
    //
    
    NSLog(@"======修改数据====");
    
    OwnClass *tmpClass =nil ;
    for (OwnClass *aClass in allClass) {
        if ([aClass.teacher isEqualToString:@"kai"]) {
            tmpClass =aClass ;
            break ;
        }
    }
    tmpClass.teacher =@"xiaoqiang" ;
    
    [[CoreDataManager defaultManager]saveWithSuccessedHandler:^{
        NSLog(@"修改表成功");
    } failedHandler:^(NSError *error) {
        NSLog(@"修改表不成功");
    }];
    
    
    
    if (error !=nil) {
        NSLog(@"全表查询失败 ,%@",error);
    }else{
        
        NSLog(@"全表查询成功");
        NSLog(@"====array:%@",allClass);
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
