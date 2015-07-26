//
//  DetailViewController.m
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import "DetailViewController.h"
#import "Element.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgDetail;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        [self.imgDetail sd_setImageWithURL:[NSURL URLWithString:self.detailItem.lrgpic]
                          placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        self.navigationItem.title = self.detailItem.name;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
