//
//  RibotMember.h
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetData.h"

@interface RibotMember : UIViewController

@property (nonatomic,strong) NSDictionary *memberData;

@property (strong, nonatomic) IBOutlet UIImageView *memberRibotar;
@property (strong, nonatomic) IBOutlet UIView *ColorView;
@property (strong, nonatomic) IBOutlet UILabel *memberName;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *memberDescription;
@property (strong, nonatomic) IBOutlet UILabel *memberRole;
@property (strong, nonatomic) IBOutlet UILabel *memberLocation;
@property (strong, nonatomic) IBOutlet UILabel *memberFavSweet;
@property (strong, nonatomic) IBOutlet UILabel *memberFavSeason;
@property (strong, nonatomic) IBOutlet UILabel *memberNickname;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;

@property (nonatomic,strong) GetData *getData;
@property (nonatomic,strong) NSString *email;

- (IBAction)sendEmail:(id)sender;
-(UIColor *)colorFromHex:(NSString *)hex;

@end
