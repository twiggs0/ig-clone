//
//  HomeViewController.m
//  insta
//
//  Created by Trevon Wiggs on 7/9/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import "AppDelegate.h"
#import "ComposeViewController.h"
#import "DetailViewController.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
#import "Parse.h"
#import "PostCell.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSArray *feedPosts;
@property (weak, nonatomic) IBOutlet UITableView *feedView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HomeViewController

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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    Post *post = self.feedPosts[indexPath.row];
    [cell setPost:post];
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)feedView numberOfRowsInSection:(NSInteger)section {
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PostCell *tappedPost = sender;
    Post *post = tappedPost.post;
    DetailViewController *detailViewController = [segue destinationViewController];
    detailViewController.post = post;
}



- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"There was an error logging out.");
        } else {
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            appDelegate.window.rootViewController = loginViewController;
        }
    }];
}
@end
