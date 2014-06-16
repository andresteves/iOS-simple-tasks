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

- (void) getUrlData : (NSString*)url completionBlock:(void (^)(BOOL succeeded, NSData *jsonResponse))completionBlock;
- (void) getRibotar : (NSString*)memberId completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
- (NSURLSessionConfiguration*) createURLSessionConfiguration;
@end
