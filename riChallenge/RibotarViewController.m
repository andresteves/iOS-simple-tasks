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
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_getData getUrlData:@"http://devchallenge.ribot.io/api/team/" completionBlock:^(BOOL success,NSData *jsonResponse){
        NSError *error;
        _receivedJSONData = (NSArray*)[NSJSONSerialization JSONObjectWithData:jsonResponse options:0 error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    }];
    
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
    
    if (!member) {
        member = [[MemberViewCell alloc] init];
    }
    
    member.memberRibotar.alpha = 0;
    
    //set then the dispatch queue to run on a separate thread.
    //this will not lock the UI while running and will allow the image to be downloaded.
    dispatch_queue_t dnlQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    //and here we go...
    dispatch_async (dnlQueue, ^(void) {
        NSString *url = [NSString stringWithFormat:@"http://devchallenge.ribot.io/api/team/%@/ribotar",[[_receivedJSONData objectAtIndex:indexPath.row] objectForKey:@"id"]];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]]; //image download starts here
        
        NSString *filename = [NSString stringWithFormat:@"image_%@.jpg",[[_receivedJSONData objectAtIndex:indexPath.row] objectForKey:@"id"]];
        id imageFile = [NSHomeDirectory() stringByAppendingPathComponent:filename];
        
        //the following queue will be executed on the main thread when the image download is complete.
        dispatch_async (dispatch_get_main_queue(), ^{
            if (imageData != nil) //always check if the image has been downloaded.
            {
                member.memberRibotar.image = [UIImage imageWithData:imageData]; //by now, the image has been downloaded and now we set it on the cell's UIImageView
                [member setNeedsLayout];
                [imageData writeToFile:imageFile atomically:YES]; //save the image data in a file for later use (see above)
            }
            else //this is the case when (for any reason) the image download was not successful
            {
                member.memberRibotar.image = [UIImage imageNamed:@"user_not_found.png"]; //instead of having an empty space, simply set a default image included in the app's sandbox
                [member setNeedsLayout];
            }
            
            [UIView animateWithDuration:0.5 animations:^{ member.memberRibotar.alpha = 1; }]; //finally, place a nice effect to fade in the UIImageView with the downloaded image
        });
    });
    
    return member;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100.0f, 100.0f);
}


#pragma mark - Navigation
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
