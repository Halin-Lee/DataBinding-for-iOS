//
//  DBViewController.m
//  DataBindingLib
//
//  Created by Halin on 11/11/2015.
//  Copyright (c) 2015 Halin. All rights reserved.
//

#import "DBViewController.h"
#import "ExampleModel.h"
#import <DataBindingLib/DataBindingLib.h>
@interface DBViewController ()
/**model,notice ,*/
@property (nonatomic,strong) ExampleModel *exampleModel;
@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _exampleModel = [[ExampleModel alloc] init];
    [[DataBindingUtil dataBindingUtil] bindModel:_exampleModel forView:self.view];
    
    _exampleModel.string = @"Test Start";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _exampleModel.string = @"String has been changer by binder";
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end