//
//  ExampleModel.m
//  Example
//
//  Created by Halin on 11/11/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import "ExampleModel.h"

#import <DataBindingLib/DataBindingLib.h>
@implementation ExampleModel

- (void)dealloc{
    [[DataBindingUtil dataBindingUtil] unbindModel:self];
}


@end
