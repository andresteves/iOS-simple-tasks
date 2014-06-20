//
//  GetData.h
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GetData : NSObject <NSURLSessionDataDelegate,NSURLSessionTaskDelegate>

- (void) getUrlData : (NSString*)url completionBlock:(void (^)(BOOL succeeded, NSData *jsonResponse))completionBlock;
- (NSURLSessionConfiguration*) createURLSessionConfiguration;
@end
