//
//  GetData.m
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import "GetData.h"

@implementation GetData

@synthesize delegateResponse;

- (void)getUrlData:(NSString *)url completionBlock:(void (^)(BOOL succeeded, NSData *jsonResponse))completionBlock
{
    NSURLSessionConfiguration *sessionConfig = [self createURLSessionConfiguration];
    NSURLSession *sessionData = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURLSessionDataTask *task = [sessionData dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                if(httpResp.statusCode/100 == 2)
                {
                    completionBlock(YES,data);
                }else{
                    completionBlock(NO,nil);
                }
            }];
    [task resume];
}


- (void)getRibotar:(NSString *)memberId completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSString *url = [NSString stringWithFormat:@"http://devchallenge.ribot.io/api/team/%@/ribotar",memberId];
    
    NSURLSessionConfiguration *sessionConfig = [self createURLSessionConfiguration];
    
    NSURLSession *sessionData = [NSURLSession sessionWithConfiguration:sessionConfig];
    
    NSURLSessionDownloadTask *ribotar = [sessionData downloadTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
            if(httpResp.statusCode/100 == 2)
            {
                UIImage *downloadedImage =
                    [UIImage imageWithData:
                     [NSData dataWithContentsOfURL:location]];
                completionBlock(YES,downloadedImage);
            }else{
                completionBlock(NO,nil);
            }
        }];
    
    [ribotar resume];
}

- (NSURLSessionConfiguration*)createURLSessionConfiguration
{
    NSURLSessionConfiguration *sessionConfig =
    [NSURLSessionConfiguration defaultSessionConfiguration];
    
    [sessionConfig setHTTPAdditionalHeaders:
     @{@"Accept": @"application/json"}];
    
    
    sessionConfig.URLCache = [NSURLCache sharedURLCache];
    sessionConfig.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
    sessionConfig.timeoutIntervalForRequest = 30.0;
    sessionConfig.timeoutIntervalForResource = 60.0;
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;
    
    return sessionConfig;
}

@end
