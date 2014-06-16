//
//  AppDelegate.h
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong,readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,strong,readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong,readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(NSString*) applicationDocumentsDirectory;

@end
