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
    NSLog(@"viewDidLoad");
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

- (void)didGetMemberRibotar:(UIImage *)ribotar
{
    
}

- (void)didGetJsonResponse:(NSData *)jsonResponse
{
    NSLog(@"getJsonResponse");
    NSError *error;
    _receivedJSONData = [NSJSONSerialization JSONObjectWithData:jsonResponse options:0 error:&error];
    
    if(error)
    {
        NSLog(@"Size : %d",[_receivedJSONData count]);
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MemberViewCell *member = [collectionView dequeueReusableCellWithReuseIdentifier:@"RibotCell" forIndexPath:indexPath];
    
    UIImage *image;
    image = nil;
    member.memberRibotar.image = image;
    
    return member;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    GetData *getData = [[GetData alloc] init];
    [getData getUrlData:@"http://devchallenge.ribot.io/api/team/"];
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

@end
