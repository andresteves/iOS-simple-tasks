//
//  RibotMember.m
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import "RibotMember.h"

@interface RibotMember ()

@end

@implementation RibotMember

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _getData = [[GetData alloc] init];
    
    //custom Email Button Border
    self.emailButton.layer.borderWidth = 0.9f;
    self.emailButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //--------------------------
    
    if(_memberData)
    {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [self.ColorView setBackgroundColor:[self colorFromHex:[_memberData objectForKey:@"hexColor"]]];
        
        [_getData getRibotar:[_memberData objectForKey:@"id"] completionBlock:^(BOOL success,UIImage *image){
            if (image) {
                _memberRibotar.image = image;
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            }
        }];
        
        _memberName.text = [NSString stringWithFormat:@"Name: %@ %@",[_memberData objectForKey:@"firstName"],
                            [_memberData objectForKey:@"lastName"]];
        
        
        
        NSString *memberData = [NSString stringWithFormat:@"%@",[_memberData objectForKey:@"url"]];
        
        [_getData getUrlData:memberData completionBlock:^(BOOL success,NSData *jsonResponse){
            NSError *error;
            NSDictionary *member = [NSJSONSerialization JSONObjectWithData:jsonResponse options:0 error:&error];
            
            if(!error)
            {
                if([member objectForKey:@"description"]!= nil)
                {
                    _memberDescription.text =  [NSString stringWithFormat:@"%@",[member objectForKey:@"description"]];
                }else{
                    _memberDescription.text = @"No Description Available";
                }
                
                if([member objectForKey:@"nickname"]!= nil)
                {
                    _memberNickname.text =  [NSString stringWithFormat:@"aka %@",[member objectForKey:@"nickname"]];
                }else{
                    _memberNickname.text = @"";
                }
                
                _memberLocation.text =[NSString stringWithFormat:@"Location : %@",[member objectForKey:@"location"]];
                
                _memberFavSweet.text  =[NSString stringWithFormat:@"Favourite Sweet : %@",[member objectForKey:@"favSweet"]];
                
                _memberFavSeason.text  =[NSString stringWithFormat:@"Favourite Season : %@",[member objectForKey:@"favSeason"]];
                
                _email = [NSString stringWithFormat:@"%@",[member objectForKey:@"email"]];
            }
            
        }];

        _memberRole.text = [NSString stringWithFormat:@"Role: %@",[_memberData objectForKey:@"role"]];
    }
}

-(UIColor *)colorFromHex:(NSString *)hex {
    unsigned int c;
    if ([hex characterAtIndex:0] == '#') {
        [[NSScanner scannerWithString:[hex substringFromIndex:1]] scanHexInt:&c];
    } else {
        [[NSScanner scannerWithString:hex] scanHexInt:&c];
    }
    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0
                           green:((c & 0xff00) >> 8)/255.0
                            blue:(c & 0xff)/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendEmail:(id)sender {
    [UIView animateWithDuration:3.0
                          delay: 5.0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         _emailButton.alpha = 0.0;
                     }
                     completion:nil];
}
@end
