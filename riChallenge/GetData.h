//
//  GetData.h
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ResponseDataDelegate <NSObject>

@required
- (void) didGetMemberRibotar:(UIImage*) ribotar;
@required
- (void) didGetJsonResponse : (NSData*) jsonResponse;

@end

@interface GetData : NSObject <NSURLSessionDataDelegate,NSURLSessionTaskDelegate>

@property (nonatomic,strong) id <ResponseDataDelegate> delegateResponse;

- (void) getUrlData : (NSString*)url;
- (void) getRibotar : (NSString*)memberId;
- (NSURLSessionConfiguration*) createURLSessionConfiguration;
@end
