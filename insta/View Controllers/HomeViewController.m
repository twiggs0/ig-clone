//
//  HomeViewController.m
//  insta
//
//  Created by Trevon Wiggs on 7/9/18.
//  Copyright © 2018 Trevon Wiggs. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
#import "ComposeViewController.h"
#import "Parse.h"
#import "PostCell.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSArray *feedPosts;
@property (weak, nonatomic) IBOutlet UITableView *feedView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.feedView.dataSource = self;
    self.feedView.delegate = self;
    
    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.feedPosts = posts;
            [self.feedView reloadData];
            
//            for (posts in self.feedPosts) {
//                NSLog(posts);
//            }
        }
        else {
            NSLog(@"There was an error retrieving your feed.");
            
        }
    }];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



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
