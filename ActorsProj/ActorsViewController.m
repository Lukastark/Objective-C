//
//  ActorsViewController.m
//  ActorsProject
//
//  Created by Luka Jashiashvili on 3/7/16.
//  Copyright © 2016 Luka Stark. All rights reserved.
//

#import "ActorsViewController.h"
#import "ActorsTableCell.h"

@interface ActorsViewController ()  <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *actors;

@end

@implementation ActorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    self.actors = [[NSArray alloc]initWithContentsOfFile:[mainBundle pathForResource:@"Actors" ofType:@"plist"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.actors.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActorsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActorViewCell"];
    
    cell.FullNameLabel.text = self.actors[indexPath.row][@"firstName"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
