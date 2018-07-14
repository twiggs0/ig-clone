//
//  ProfileViewController.m
//  insta
//
//  Created by Trevon Wiggs on 7/13/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileViewCell.h"


@interface ProfileViewController ()

@property (nonatomic, strong) NSArray *feedPosts;
@property (weak, nonatomic) IBOutlet UICollectionView *feedView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchUserPosts) forControlEvents:UIControlEventValueChanged];
    [self.feedView insertSubview:self.refreshControl atIndex:0];
    

    self.feedView.dataSource = self;
    self.feedView.delegate = self;
    
    
    [self fetchUserPosts];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfileViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileViewCell" forIndexPath:indexPath];
    
    Post *post = self.feedPosts[indexPath.item];
    [cell setPost:post];
    return cell;
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)feedView numberOfItemsInSection:(NSInteger)section {
    return self.feedPosts.count;
}

- (void)fetchUserPosts {
    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    [postQuery includeKey:@"createdAt"];
    postQuery.limit = 20;
    
    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.feedPosts = posts;
            [self.feedView reloadData];
        } else {
            NSLog(@"There was an error retrieving your feed.");
        }
        [self.refreshControl endRefreshing];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
