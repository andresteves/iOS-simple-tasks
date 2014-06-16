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
#import "MemberViewController.h"

@interface RibotarViewController : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong,nonatomic) NSArray *receivedJSONData;
@property (nonatomic,strong) GetData *getData;

@end
