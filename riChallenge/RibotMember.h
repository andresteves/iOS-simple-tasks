//
//  RibotMember.h
//  riChallenge
//
//  Created by Andre Esteves on 16/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RibotMember : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * hexColor;
@property (nonatomic, retain) NSString * role;
@property (nonatomic, retain) NSString * memberDsc;
@property (nonatomic, retain) NSString * nickname;
@property (nonatomic, retain) NSString * twitterAcc;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * favSweet;
@property (nonatomic, retain) NSString * favSeason;
@property (nonatomic, retain) NSString * memberId;
@property (nonatomic, retain) NSData * ribotar;

@end
