//
//  RibotarViewController.m
//  riChallenge
//
//  Created by Andre Esteves on 14/06/14.
//  Copyright (c) 2014 Estevex. All rights reserved.
//

#import "RibotarViewController.h"

@interface RibotarViewController ()

@end

@implementation RibotarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self collectionView] setBackgroundColor:[UIColor colorWithWhite:0.25f alpha:1.0f]];
    _getData = [[GetData alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MemberViewCell *member = [collectionView dequeueReusableCellWithReuseIdentifier:@"RibotCell" forIndexPath:indexPath];
   
    member.memberRibotar.image = [UIImage imageNamed:@"user_not_found.png"];
    
    #pragma mark - API CALL
    //Maybe not the better approach since i am repeating calls to the API
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [_getData getUrlData:@"http://devchallenge.ribot.io/api/team/" completionBlock:^(BOOL success,NSData *jsonResponse){
        NSError *error;
        _receivedJSONData = (NSArray*)[NSJSONSerialization JSONObjectWithData:jsonResponse options:0 error:&error];
        
        if(!error)
        {
            NSDictionary *dic = [_receivedJSONData objectAtIndex:indexPath.row];
            [_getData getRibotar:[dic objectForKey:@"id"] completionBlock:^(BOOL success,UIImage *image){
                if (image) {
                    member.memberRibotar.image = image;
                    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                }
            }];
        }
    }];
    
    return member;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detailMember"])
    {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        NSDictionary *member = [_receivedJSONData objectAtIndex:indexPath.row];
        
        MemberViewController *ribotMember = (MemberViewController *)[segue destinationViewController];
        ribotMember.memberData = member;
    }
}

@end
