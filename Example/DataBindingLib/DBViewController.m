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
/**model,DataBinding不引用model,需要自行管理其生命周期,model释放将自行解绑*/
@property (nonatomic,strong) ExampleModel *exampleModel;
@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //构造一个model并绑定到view上,DataBindingUtil将自动遍历所有的view实现绑定
    _exampleModel = [[ExampleModel alloc] init];
    [[DataBindingUtil dataBindingUtil] bindModel:_exampleModel forView:self.view];
    
    //赋初始值
    _exampleModel.string = @"Test Start";
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延时修改,view上文本随之修改
        _exampleModel.string = @"String has been changer by binder";
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end