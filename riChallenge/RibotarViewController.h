//
//  RibotarViewController.h
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetData.h"
#import "MemberViewCell.h"

@interface RibotarViewController : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate,ResponseDataDelegate>

@property (strong,nonatomic) NSArray *ribotars;
@property (strong,nonatomic) NSDictionary *receivedJSONData;

@end
